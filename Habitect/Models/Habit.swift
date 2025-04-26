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

// 🔥 BURAYA EKLİYORUZ

extension Habit {
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        return dictionary ?? [:]
    }
}

extension Dictionary {
    func toObject<T: Decodable>(_ type: T.Type) throws -> T {
        let data = try JSONSerialization.data(withJSONObject: self)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
