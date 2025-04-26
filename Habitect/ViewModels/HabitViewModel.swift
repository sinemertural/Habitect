//
//  HabitViewModel.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class HabitViewModel: ObservableObject {
    
    init() {
        fetchHabits()
    }

    @Published var habits: [Habit] = []
    
    private let habitService = HabitService.shared

    // ✅ Tamamlanma oranı
    var completionRate: Double {
        guard !habits.isEmpty else { return 0.0 }
        let completedCount = habits.filter { $0.isCompleted }.count
        return Double(completedCount) / Double(habits.count)
    }

    // ✅ Tamamlanma durumunu değiştir
    func toggleCompletion(for habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits[index].isCompleted.toggle()
        }
    }

    // ✅ Bugünün alışkanlıkları (Mon, Tue... karşılaştırması yapılır)
    func habitsForToday() -> [Habit] {
        let today = DateFormatter.shortWeekday(from: Date())
        return habits.filter { $0.repeatDays.contains(today) }
    }
    
    func completionRateForToday() -> Double {
        let todayHabits = habitsForToday()
        guard !todayHabits.isEmpty else { return 0.0 }
        let completed = todayHabits.filter { $0.isCompleted }.count
        return Double(completed) / Double(todayHabits.count)
    }


    // ✅ Yeni alışkanlık ekle
    func addHabit(title: String, description: String = "", repeatDays: [String] = [], date: Date = Date()) {
        let newHabit = Habit(title: title, description: description, isCompleted: false, date: date, repeatDays: repeatDays)

        habitService.addHabit(newHabit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.habits.append(newHabit)
                case .failure(let error):
                    print("Alışkanlık eklenemedi: \(error.localizedDescription)")
                }
            }
        }
    }


    // ✅ Alışkanlık sil
    func deleteHabit(habit: Habit) {
        habitService.deleteHabit(habit) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success():
                    self?.habits.removeAll { $0.id == habit.id }
                case .failure(let error):
                    print("Alışkanlık silinemedi: \(error.localizedDescription)")
                }
            }
        }
    }

    
    func fetchHabits() {
        habitService.fetchHabits { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habits):
                    self?.habits = habits
                case .failure(let error):
                    print("Habits çekilemedi: \(error.localizedDescription)")
                }
            }
        }
    }

}

// ✅ DateFormatter extension (bugünün kısa gün adını almak için)
extension DateFormatter {
    static func shortWeekday(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE" // "Mon", "Tue", ...
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
}
