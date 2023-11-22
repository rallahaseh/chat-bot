//
//  User.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// A struct representing a user in the chat.
public struct User: Codable, Identifiable, Hashable {
    
    /// A unique identifier for the user.
    public let id: String
    
    /// The name of the user.
    public let name: String
    
    /// The URL of the user's avatar (can be nil if not available).
    public let avatarURL: URL?
    
    /// A boolean flag indicating whether the user is the current user.
    public let isCurrentUser: Bool
    
    /// Initializes a new User object with the provided information.
    ///
    /// - Parameters:
    ///   - id: A unique identifier for the user.
    ///   - name: The name of the user.
    ///   - avatarURL: The URL of the user's avatar (can be nil).
    ///   - isCurrentUser: A boolean flag indicating whether the user is the current user.
    public init(id: String, name: String, avatarURL: URL?, isCurrentUser: Bool) {
        self.id = id
        self.name = name
        self.avatarURL = avatarURL
        self.isCurrentUser = isCurrentUser
    }
}

extension User {
    /// Converts a `User` to a `MockUser` for chat representation.
    ///
    /// - Returns: A `MockUser` object with equivalent properties.
    func toMockUser() -> MockUser {
        MockUser(uid: id, name: name, avatar: avatarURL)
    }
}
