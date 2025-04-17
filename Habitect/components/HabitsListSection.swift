//
//  HabitsListSection.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct Habit: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

struct HabitsListSection: View {
    @State private var habits: [Habit] = [
        Habit(title: "Drink Water", isCompleted: false),
        Habit(title: "Read 10 pages", isCompleted: true),
        Habit(title: "Walk 30 mins", isCompleted: false)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Habits")
                .font(.headline)
                .foregroundColor(.primary)

            ForEach($habits) { $habit in
                HStack {
                    Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(habit.isCompleted ? .green : .gray)
                        .onTapGesture {
                            habit.isCompleted.toggle()
                        }

                    Text(habit.title)
                        .foregroundColor(.primary)

                    Spacer()
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
            }
        }
    }
}

#Preview {
    HabitsListSection()
        .padding()
}
