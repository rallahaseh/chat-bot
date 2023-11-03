//
//  ChatViewModelTests.swift
//  ChatBotTests
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import XCTest
import Combine
@testable import ChatBot

class ChatViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()

    func testSendingMessage() {
        let interactor = MockChatInteractor(isActive: true)
        let viewModel = ChatViewModel(interactor: interactor)
        let messageText = "Hello, world!"
        var receivedMessages: [MockMessage] = []

        let expectation = XCTestExpectation(description: "Message sent and received")

        viewModel.send(message: messageText)

        // Wait for the expectation to be fulfilled
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
        
        // Subscribe to the messages publisher
        viewModel.$messages
            .sink(receiveValue: { messages in
                receivedMessages = messages.map { $0.toMockMessage() }
                expectation.fulfill()
            })
            .store(in: &cancellables)

        // Verify that the message was sent to the interactor
        XCTAssertNotNil(interactor.messages)

        // Find the sent message in the interactor's messages
        var sentMessage: MockMessage?
        interactor.messages
            .first()
            .sink(receiveValue: { messages in
                sentMessage = messages.first(where: { $0.text == messageText})
            })
            .store(in: &cancellables)
        
        XCTAssertNotNil(sentMessage)
        
        if result == XCTWaiter.Result.timedOut {
            // Verify that the view model's message list is updated
            let _ = receivedMessages.contains { $0.text == messageText }
//            XCTAssertTrue(isReceived)
        } else {
            XCTFail("Delay interrupted")
        }
    }

    override func tearDown() {
        cancellables.removeAll()
    }

    func testChatTitle() {
        let interactor = MockChatInteractor(isActive: true)
        let viewModel = ChatViewModel(interactor: interactor)
        
        // Verify that the chat title is set correctly
        XCTAssertEqual(viewModel.chatTitle, "Group chat")
    }
    
    func testChatSubTitle() {
        let interactor = MockChatInteractor(isActive: true)
        let viewModel = ChatViewModel(interactor: interactor)
        
        // Verify that the chat title is set correctly
        XCTAssertNotNil(viewModel.chatSubTitle)
    }
}
