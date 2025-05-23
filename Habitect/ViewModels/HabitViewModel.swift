//
//  HabitViewModel.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation
import SwiftUI
import FirebaseFirestore

final class HabitViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var habits: [Habit] = []
    
    // MARK: - Dependencies
    private let habitService = HabitService.shared
    
    // MARK: - Initialization
    init() {
        observeHabits()
        NotificationCenter.default.addObserver(self, selector: #selector(handleLogin), name: .didLogin, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Computed Properties
    
    /// Günlük tamamlanma oranı
    var completionRate: Double {
        calculateCompletionRate(for: habits)
    }

    /// Bugünün alışkanlıkları
    func habitsForToday() -> [Habit] {
        let today = DateFormatter.shortWeekday(from: Date())
        return habits.filter { $0.repeatDays.contains(today) }
    }

    /// Bugüne özel tamamlanma oranı
    func completionRateForToday() -> Double {
        let todayHabits = habitsForToday()
        return calculateCompletionRate(for: todayHabits)
    }

    // MARK: - Habit Operations

    func observeHabits() {
        habitService.observeHabits { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habits):
                    self?.habits = habits
                case .failure(let error):
                    print("Canlı veri dinlenemedi: \(error.localizedDescription)")
                }
            }
        }
    }

    func toggleCompletion(for habit: Habit) {
        guard let index = habits.firstIndex(where: { $0.id == habit.id }) else { return }
        
        habits[index].isCompleted.toggle()
        let updatedHabit = habits[index]
        
        habitService.updateHabit(updatedHabit) { result in
            if case .failure(let error) = result {
                print("Güncelleme hatası: \(error.localizedDescription)")
            }
        }
    }

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

    func deleteHabit(_ habit: Habit) {
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
        DispatchQueue.main.async {
            self.habits = []
        }
        
        habitService.fetchHabits { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let habits):
                    self?.habits = habits
                case .failure(let error):
                    print("Alışkanlıklar getirilemedi: \(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - Helpers
    
    private func calculateCompletionRate(for habits: [Habit]) -> Double {
        guard !habits.isEmpty else { return 0.0 }
        let completedCount = habits.filter { $0.isCompleted }.count
        return Double(completedCount) / Double(habits.count)
    }

    @objc private func handleLogin() {
        observeHabits()
    }
}

// MARK: - DateFormatter Extension

extension DateFormatter {
    static func shortWeekday(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE" // örn. "Mon", "Tue"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: date)
    }
}
