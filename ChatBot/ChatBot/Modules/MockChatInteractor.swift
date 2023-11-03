//
//  MockChatInteractor.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation
import Combine

final class MockChatInteractor: ChatInteractorProtocol {
    private lazy var chatData = MockChatData()
    private lazy var chatState = CurrentValueSubject<[MockMessage], Never>(generateStartMessages())
    private lazy var sharedState = chatState.share()
    
    private let isActive: Bool
    private var lastDate = Date()
    
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: - Properties
    
    var messages: AnyPublisher<[MockMessage], Never> {
        sharedState.eraseToAnyPublisher()
    }
    
    var senders: [MockUser] {
        var members = [chatData.rashed, chatData.rajiv]
        if isActive { members.append(chatData.smita) }
        return members
    }
    
    var sendersWithoutMainUser: [MockUser] {
        senders.filter { !$0.isCurrentUser }
    }
    
    var currentUser: MockUser? {
        return senders.first { $0.isCurrentUser }
    }
    
    // MARK: - Initialization
    
    init(isActive: Bool = false) {
        self.isActive = isActive
    }
}

// MARK: - Chat Interactor Functionalities

extension MockChatInteractor {
    
    // MARK: - Send a Message
    func send(message: String) {
        guard let currentUser = self.currentUser else {
            return
        }
        var status: MessageStatus = .sending
        
        // Generate error with random chance
        if Int.random(in: 0...3) == 0 {
            status = .error
        }
        
        let message = MockMessage(
            uid: UUID().uuidString,
            sender: currentUser,
            createdAt: Date(),
            text: message,
            status: status
        )
        
        // Add the new message to the chat state
        DispatchQueue.main.async { [weak self] in
            self?.chatState.value.append(message)
        }
    }
    
    // MARK: - Connect to the Chat
    func connect() {
        let randomSeconds = TimeInterval(Int.random(in: 5...10))
        Timer.publish(every: randomSeconds, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.updateSendingStatuses()
                
                if self?.isActive ?? false {
                    self?.generateNewMessage()
                }
            }
            .store(in: &subscriptions)
    }
    
    // MARK: - Disconnect from the Chat
    func disconnect() {
        subscriptions.removeAll()
    }
}

// MARK: - Chat Message Generation

extension MockChatInteractor {
    
    // Generate an initial set of chat messages
    func generateStartMessages() -> [MockMessage] {
        defer {
            lastDate = lastDate.addingTimeInterval(-(60*60*24))
        }
        
        return (0...2)
            .map { index in
                chatData.randomMessage(senders: senders, date: lastDate.randomTime())
            }
            .sorted { lhs, rhs in
                lhs.createdAt < rhs.createdAt
            }
    }
    
    // Generate a new chat message
    func generateNewMessage() {
        let message = chatData.randomMessage(senders: sendersWithoutMainUser)
        chatState.value.append(message)
    }
    
    // Update the sending statuses of chat messages
    func updateSendingStatuses() {
        let updated = chatState.value.map {
            var message = $0
            if message.status == .sending {
                message.status = .sent
            } else if message.status == .sent {
                message.status = .read
            }
            return message
        }
        chatState.value = updated
    }
}
