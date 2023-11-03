//
//  ChatInteractorProtocol.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation
import Combine

/// A protocol defining the interaction between the chat interface and its underlying data source.
protocol ChatInteractorProtocol {
    
    /// A publisher that emits an array of `MockMessage` objects.
    var messages: AnyPublisher<[MockMessage], Never> { get }
    
    /// An array of senders (users) participating in the chat.
    var senders: [MockUser] { get }
    
    /// An array of senders excluding the main user.
    var sendersWithoutMainUser: [MockUser] { get }
    
    /// Sends a message to the chat.
    ///
    /// - Parameter message: The message to be sent.
    func send(message: String)
    
    /// Establishes a connection to the chat server.
    func connect()
    
    /// Disconnects from the chat server.
    func disconnect()
}
