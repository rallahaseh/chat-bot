//
//  Message.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// A struct representing a message in the chat.
public struct Message: Identifiable, Hashable, Equatable {
    
    /// A unique identifier for the message.
    public var id: String
    
    /// The user who sent the message.
    public var user: User
    
    /// The status of the message (can be nil).
    public var status: MessageStatus?
    
    /// The date and time the message was created.
    public var createdAt: Date
    
    /// The text content of the message.
    public var text: String
        
    /// Initializes a new Message object with the provided information.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the message.
    ///   - user: The user who sent the message.
    ///   - status: The status of the message (can be nil).
    ///   - createdAt: The date and time the message was created (default is the current date).
    ///   - text: The text content of the message (default is an empty string).
    public init(id: String, user: User, status: MessageStatus? = nil, createdAt: Date = Date(), text: String = "") {
        
        self.id = id
        self.user = user
        self.status = status
        self.createdAt = createdAt
        self.text = text
    }
    
    /// Determines whether two messages are equal.
    public static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.id == rhs.id && lhs.status == rhs.status
    }
}
