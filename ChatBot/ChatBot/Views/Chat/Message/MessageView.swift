//
//  MessageView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct MessageView: View {
    // An observed object for loading user avatars.
    @ObservedObject var imageLoader: DataFetcher
    
    // The image to display in the view.
    @State var image: UIImage = UIImage()
    
    // The message to be displayed.
    let message: Message
    
    // Initialize the view with a message and an image loader.
    init(message: Message) {
        self.message = message
        self.imageLoader = DataFetcher(from: message.user.avatarURL)
    }
}

extension MessageView {
    var body: some View {
        HStack(alignment: .bottom, spacing: .zero) {
            if !message.user.isCurrentUser {
                avatarView
            }
            VStack(alignment: message.user.isCurrentUser ? .trailing : .leading, spacing: 2) {
                ContentMessageView(for: message)
            }
            if message.user.isCurrentUser, let status = message.status {
                MessageStatusView(status: status) {
                    if case .error = status {
                        // TODO: - Resend message if it fails
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var avatarView: some View {
        Group {
            if message.user.isCurrentUser {
                Spacer()
            } else {
                if #available(iOS 15.0, *) {
                    // Async image loading for avatars (iOS 15 and later).
                    AsyncImage(
                        url: message.user.avatarURL,
                        content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 32, maxHeight: 32)
                                .cornerRadius(16)
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                } else {
                    // Synchronous image loading for avatars (iOS 13 and 14).
                    Image(uiImage: image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .onReceive(imageLoader.didChange) { data in
                            self.image = UIImage(data: data) ?? UIImage()
                        }
                }
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        let avatar = URL(string: "https://ui-avatars.com/api/?name=Rashed")
        let user = User(id: "99", name: "Test User", avatarURL: avatar, isCurrentUser: false)
        let message = Message(id: "123", user: user, status: .read, text: "Hello My Friend!")
        MessageView(message: message)
    }
}
