//
//  HomeView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct HomeView: View {
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
