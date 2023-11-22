//
//  MockUser.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// Represents a mock user for the chat.
struct MockUser: Equatable {
    let uid: String   /// Unique identifier for the user.
    let name: String  /// Name of the user.
    let avatar: URL?  /// URL to the user's avatar image.
}

// MARK: - Functionalities

extension MockUser {
    /// Checks if the user is the current user (based on a default UID of "1").
    var isCurrentUser: Bool {
        uid == "1"
    }

    /// Converts a `MockUser` to a `User` for chat representation.
    ///
    /// - Returns: A `User` object with equivalent properties.
    func toChatUser() -> User {
        User(id: uid, name: name, avatarURL: avatar, isCurrentUser: isCurrentUser)
    }
}
