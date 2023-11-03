//
//  ContentMessageView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct ContentMessageView: View {
    // Horizontal padding for text.
    static let horizontalTextPadding: CGFloat = 12
    
    // Vertical padding for text.
    static let verticalTextPadding: CGFloat = 10
    
    // The message to be displayed.
    let message: Message
    
    // Initialize the view for a specific message.
    init(for message: Message) {
        self.message = message
    }
}

extension ContentMessageView {
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            let backgroundColor: Color = message.status == .error ? .red : message.user.isCurrentUser ? Colors.primary : Colors.messageBackground
            textWithTimeView(message)
                .foregroundColor(Colors.messageContent)
                .background(backgroundColor)
                .cornerRadius(20)
                .padding(ContentMessageView.verticalTextPadding)
        }
    }
    
    @ViewBuilder
    func textWithTimeView(_ message: Message) -> some View {
        let messageView = Text(message.text)
            .fixedSize(horizontal: false, vertical: true)
            .padding(.horizontal, ContentMessageView.horizontalTextPadding)
        let timeView = messageTimeView(time: message.time)
            .padding(.trailing, ContentMessageView.horizontalTextPadding)
        Group {
            VStack(alignment: .leading, spacing: 4) {
                messageView
                HStack(spacing: .zero) {
                    Spacer()
                    timeView
                }
            }
            .padding(.vertical, 8)
        }
    }
    
    func messageTimeView(time: String) -> some View {
        Group {
            Text(time)
                .font(.caption)
                .foregroundColor(Color.gray)
                .opacity(0.4)
        }
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        let avatar = URL(string: "https://ui-avatars.com/api/?name=Rashed")
        let user = User(id: "99", name: "Rashed", avatarURL: avatar, isCurrentUser: true)
        let msg = Message(id: "123", user: user, text: "TEST MESSAGE")
        ContentMessageView(for: msg)
    }
}
