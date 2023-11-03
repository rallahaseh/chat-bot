//
//  ChatViewModel.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation
import Combine

/// A view model that manages the chat interface and its interactions.
final class ChatViewModel: ObservableObject {
    
    /// Published property to store chat messages.
    @Published var messages: [Message] = []
    
    /// A computed property that represents the chat's title based on the number of participants.
    var chatTitle: String {
        interactor.sendersWithoutMainUser.count == 1 ? (interactor.sendersWithoutMainUser.first?.name ?? "") : "Group chat"
    }
    
    /// A computed property that represents the chat's status based on the number of participants.
    var chatSubTitle: String {
        interactor.sendersWithoutMainUser.count == 1 ? "Online" : "\(interactor.senders.count) members"
    }

    private let interactor: ChatInteractorProtocol

    init(interactor: ChatInteractorProtocol) {
        self.interactor = interactor
    }
    
    /// Sends a message to the chat.
    ///
    /// - Parameter message: The message to be sent.
    func send(message: String) {
        interactor.send(message: message)
    }
    
    /// Starts the chat, sets up message subscriptions, and connects to the chat server.
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    /// Stops the chat and disconnects from the chat server.
    func onStop() {
        interactor.disconnect()
    }
}
