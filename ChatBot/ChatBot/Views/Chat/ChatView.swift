//
//  ChatView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct ChatView: View {
    // The view model for managing the chat interface.
    @StateObject private var viewModel: ChatViewModel
    
    // The text entered by the user.
    @State private var typedMessage: String = ""
    
    // A proxy for scrolling in the chat.
    @State private var scrollProxy: ScrollViewProxy? = nil
    
    // Initialize the view with a view model.
    init(viewModel: ChatViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}

extension ChatView {
    var body: some View {
        NavigationView {
            VStack {
                // Chat Messages
                ScrollViewReader { proxy in
                    ScrollView(.vertical) {
                        LazyVStack {
                            ForEach(viewModel.messages, id: \.self) { message in
                                MessageView(message: message)
                            }
                            .onAppear {
                                scrollProxy = proxy
                            }
                        }
                    }
                    .padding(.top, 1)
                    .background(Colors.chatBackground)
                }
                // Input Field and Send Button
                HStack {
                    TextField("Message ...", text: $typedMessage)
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 1))
                        .frame(minHeight: 50)
                    
                    Button(action: sendMessage) {
                        Text("Send")
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(10) // Add padding to the HStack
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Title and Status in the Navigation Bar
            ToolbarItem(placement: .principal) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.chatTitle)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .foregroundColor(Colors.title)
                    if let subTitle = viewModel.chatSubTitle {
                        Text(subTitle)
                            .font(.footnote)
                            .foregroundColor(Color.blue)
                    }
                }
            }
        }
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
        .onChange(of: viewModel.messages) { _ in
            withAnimation {
                scrollProxy?.scrollTo(viewModel.messages[viewModel.messages.endIndex - 1])
            }
        }
    }
}

// MARK: - Functionalities
extension ChatView {
    // Send a user message to the chat.
    func sendMessage() {
        guard !typedMessage.isEmpty else {
            return
        }
        viewModel.send(message: typedMessage)
        typedMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel(interactor: MockChatInteractor()))
    }
}
