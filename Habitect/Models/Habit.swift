//
//  Habit.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation

struct Habit: Identifiable, Codable {
    var id: UUID
    var title: String
    var description: String
    var isCompleted: Bool
    var date: Date
    var repeatDays: [String]
    
    init(id: UUID = UUID(), title: String, description: String, isCompleted: Bool, date: Date, repeatDays: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.date = date
        self.repeatDays = repeatDays
    }

}

// 🔥 BURAYA EKLİYORUZdksl



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
