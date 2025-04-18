//
//  HabitsListSection.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.


import SwiftUI

struct HabitsListSection: View {
    let habits: [Habit]
    @ObservedObject var viewModel: HabitViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Habits")
                .font(.headline)
                .padding(.horizontal)

            if habits.isEmpty {
                Text("No habits for today 🎈")
                    .foregroundColor(.gray)
                    .italic()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
            } else {
                List {
                    ForEach(habits) { habit in
                        HStack {
                            Image(systemName: habit.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(habit.isCompleted ? .green : .gray)
                                .onTapGesture {
                                    viewModel.toggleCompletion(for: habit)
                                }

                            Text(habit.title)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            let habit = habits[index]
                            viewModel.deleteHabit(habit: habit)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height: CGFloat(habits.count * 60) + 60)
            }
        }
    }
}

#Preview {
    HabitsListSection(habits: HabitViewModel().habitsForToday(), viewModel: HabitViewModel())
        .environmentObject(HabitViewModel())
        .padding()
}
