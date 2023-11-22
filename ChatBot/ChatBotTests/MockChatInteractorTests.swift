//
//  MockChatInteractorTests.swift
//  ChatBotTests
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import XCTest
import Combine
@testable import ChatBot

class MockChatInteractorTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    func testSendingMessage() {
        let interactor = MockChatInteractor(isActive: true)
        let messageText = "Hello, world!"
        
        // Create an expectation for the message to be added
        let messageExpectation = XCTestExpectation(description: "Message sent")
        
        // Capture the last message for later verification
        var updatedMessages: [MockMessage]?
        
        interactor.send(message: messageText)
        
        // Wait for the message expectation to be fulfilled
        let result = XCTWaiter.wait(for: [messageExpectation], timeout: 5.0)
        
        // Set up a subscriber to monitor the messages
        interactor.messages
            .sink { messages in
                updatedMessages = messages
                messageExpectation.fulfill()
            }
            .store(in: &cancellables)
        
        if result == XCTWaiter.Result.timedOut {
            // Verify that the message was added to the list of messages
            XCTAssertNotNil(updatedMessages?.first(where: { $0.text == messageText}))
        } else {
            XCTFail("Delay interrupted")
        }
    }
    
    func testReceivingMessages() {
        let interactor = MockChatInteractor(isActive: true)
        
        // Simulate receiving messages from the server
        interactor.generateNewMessage()
        
        // Verify that the received messages are appended to the list of messages
        var messagesCount = 0
        let expectation = XCTestExpectation(description: "Receiving Messages")
        
        interactor.messages
            .sink { messages in
                messagesCount = messages.count
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [expectation], timeout: 1)
        
        XCTAssertGreaterThan(messagesCount, 0)
    }
}
