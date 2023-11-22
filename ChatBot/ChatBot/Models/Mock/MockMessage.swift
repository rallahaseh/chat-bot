//
//  MockMessage.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// Represents a mock message in the chat.
struct MockMessage {
    let uid: String             /// Unique identifier for the message.
    let sender: MockUser        /// The sender of the message.
    let createdAt: Date         /// The timestamp when the message was created.
    let text: String            /// The content of the message.
    var status: MessageStatus?  /// The status of the message (e.g., sending, sent, read, or error).
    
}

// MARK: - Functionalities

extension MockMessage {
    /// Converts a `MockMessage` to a `Message` for chat representation.
    ///
    /// - Returns: A `Message` object with equivalent properties.
    func toChatMessage() -> Message {
        Message(
            id: uid,
            user: sender.toChatUser(),
            status: status,
            createdAt: createdAt,
            text: text
        )
    }
}
