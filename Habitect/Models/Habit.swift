//
//  Habit.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation

struct Habit: Identifiable, Codable {
    let id: UUID = UUID()
    var title: String
    var description: String
    var isCompleted: Bool
    var date: Date
    var repeatDays: [String] 
}
