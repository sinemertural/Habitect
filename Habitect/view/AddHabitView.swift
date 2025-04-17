//
//  AddHabitView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct AddHabitView: View {
    @State private var title: String = ""
    @State private var selectedDays: Set<String> = []
    @State private var reminderEnabled: Bool = false
    @State private var selectedTime = Date()

    let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    var body: some View {
        NavigationView {
            Form {
                // 📌 Alışkanlık Başlığı
                Section(header: Text("Habit Title")) {
                    TextField("e.g. Drink Water", text: $title)
                }

                // 🗓️ Gün seçimi
                Section(header: Text("Repeat On")) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
                        ForEach(weekDays, id: \.self) { day in
                            Button(action: {
                                toggleDay(day)
                            }) {
                                Text(day)
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(selectedDays.contains(day) ? Color.primaryColor : Color.secondary.opacity(0.2))
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }

                // ⏰ Hatırlatma
                Section {
                    Toggle("Reminder", isOn: $reminderEnabled)

                    if reminderEnabled {
                        DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    }
                }

                // ✅ Kaydet Butonu
                Section {
                    Button(action: {
                        // Alışkanlığı kaydetme işlemi burada olacak
                        print("Saved habit: \(title)")
                    }) {
                        Text("Save Habit")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.primaryColor)
                            .cornerRadius(10)
                    }
                }
            }
            .navigationTitle("Add Habit")
        }
    }

    func toggleDay(_ day: String) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
    }
}

#Preview {
    AddHabitView()
}
