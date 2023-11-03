//
//  View+.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import SwiftUI

// An extension to hide the keyboard when called.
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        // Use UIKit's UIResponder to send an action to resign the first responder (dismiss the keyboard).
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
