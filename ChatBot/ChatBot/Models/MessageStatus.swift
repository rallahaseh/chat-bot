//
//  MessageStatus.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

/// An enum representing the status of a chat message.
public enum MessageStatus: Equatable, Hashable {
    
    /// The message is currently being sent.
    case sending
    
    /// The message has been successfully sent.
    case sent
    
    /// The message has been read by the recipient.
    case read
    
    /// An error occurred while sending the message.
    case error
    
    /// Generates a hash value for the enum cases.
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .sending:
            hasher.combine("sending")
        case .sent:
            hasher.combine("sent")
        case .read:
            hasher.combine("read")
        case .error:
            hasher.combine("error")
        }
    }
    
    /// Compares two `MessageStatus` values for equality.
    public static func == (lhs: MessageStatus, rhs: MessageStatus) -> Bool {
        switch (lhs, rhs) {
        case (.sending, .sending):
            return true
        case (.sent, .sent):
            return true
        case (.read, .read):
            return true
        case (.error, .error):
            return true
        default:
            return false
        }
    }
}
