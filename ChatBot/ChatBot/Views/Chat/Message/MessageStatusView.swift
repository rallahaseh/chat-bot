//
//  MessageStatusView.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

struct MessageStatusView: View {
    // The status of the message (e.g., sending, sent, read, error).
    let status: MessageStatus
    
    // A closure to handle retrying a message (used in case of an error status).
    let onRetry: () -> Void

    var body: some View {
        Group {
            switch status {
            case .sending:
                Image("time-left")
                    .resizable()
            case .sent:
                Image("check")
                    .resizable()
            case .read:
                Image("check")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(Color.green)
            case .error:
                Button {
                    onRetry()
                } label: {
                    Image("warning")
                        .resizable()
                }
                .foregroundColor(Color.red)
            }
        }
        .frame(width: 16.0, height: 16.0)
        .padding(.trailing, 8.0)
    }
}

struct MessageStatusView_Previews: PreviewProvider {
    static var previews: some View {
        MessageStatusView(status: .read, onRetry: {})
    }
}
