//
//  MockChatData.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// A class responsible for generating mock chat data.
final class MockChatData {
    let system = MockUser(
        uid: "0",
        name: "System",
        avatar: nil
    )
    let rashed = MockUser(
        uid: "1",
        name: "Rashed",
        avatar: URL(string: "https://i.pravatar.cc/150?img=8")
    )
    let rajiv = MockUser(
        uid: "2",
        name: "Rajiv",
        avatar: URL(string: "https://i.pravatar.cc/150?img=11")
    )
    let smita = MockUser(
        uid: "2",
        name: "Smita",
        avatar: URL(string: "https://i.pravatar.cc/150?img=10")
    )
    
    /// Generates a random mock message for the chat.
    ///
    /// - Parameters:
    ///   - senders: An array of mock users who can be potential senders (optional).
    ///   - date: The timestamp of the message (optional).
    /// - Returns: A random `MockMessage` with generated content and sender.
    func randomMessage(senders: [MockUser] = [], date: Date? = nil) -> MockMessage {
        let senders = senders.isEmpty ? [rashed, rajiv] : senders
        let sender = senders.randomElement()!
        let date = date ?? Date()
        
        
        let generateText = "TEST"
        
        return MockMessage(
            uid: UUID().uuidString,
            sender: sender,
            createdAt: date,
            text: generateText,
            status: sender.isCurrentUser ? .read : nil
        )
    }
}
