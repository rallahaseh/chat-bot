//
//  HomeView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isShowingChatView = false
    
    // Initialize the view model with a mock chat interactor.
    private let viewModel = ChatViewModel(
        interactor: MockChatInteractor(isActive: true)
    )
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Text("ChatBot")
                    .font(.title)
                    .foregroundColor(Color.gray)
                Spacer().frame(height: 32)
                
                // Description
                Text("A chat bot where the response from the server will arrive after a random delay. Multiple requests can be received at the same time and don’t need to be received in the same order they were sent.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding([.leading, .trailing], 32)
                Spacer().frame(height: 32)
                
                // Image
                Image("robot")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                
                // Start Chat Button
                NavigationLink(destination: ChatView(viewModel: viewModel), isActive: $isShowingChatView) {
                    Button(action: {
                        self.isShowingChatView = true
                    }) {
                        Text("Start Chat")
                            .frame(maxWidth: .infinity)
                            .font(.system(size: 24))
                            .foregroundColor(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 24)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                            .padding([.leading, .trailing], 32)
                    }
                }
            }
        }
        .navigationTitle("Navigation")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
