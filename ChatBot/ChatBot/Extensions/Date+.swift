//
//  Date+.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation

extension Date {
    // Generates a random time within the current date's day.
    func randomTime() -> Date {
        // Get the current date's year, month, and day components.
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        
        // Generate random values for hours, minutes, and seconds.
        components.hour = Int.random(in: 0...23)
        components.minute = Int.random(in: 0...59)
        components.second = Int.random(in: 0...59)
        
        // Create a new date with the random time components.
        return Calendar.current.date(from: components)!
    }
}
