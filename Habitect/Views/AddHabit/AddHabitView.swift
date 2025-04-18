//
//  AddHabitView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct AddHabitView: View {
    @EnvironmentObject var viewModel: HabitViewModel

    @State private var title: String = ""
    @State private var selectedDays: Set<String> = []
    @State private var reminderEnabled: Bool = false
    @State private var selectedTime = Date()

    let weekDays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    var body: some View {
        NavigationView {
            Form {
                // 🔤 Başlık
                Section(header: Text("Habit Title")) {
                    TextField("e.g. Drink Water", text: $title)
                }

                // 🔁 Gün Seçimi
                Section(header: Text("Repeat On")) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 12) {
                        ForEach(weekDays, id: \.self) { day in
                            Text(day)
                                .font(.subheadline)
                                .frame(width: 60, height: 40)
                                .background(selectedDays.contains(day) ? Color.primaryColor : Color.secondary.opacity(0.15))
                                .foregroundColor(selectedDays.contains(day) ? .white : .primary)
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.primaryColor.opacity(selectedDays.contains(day) ? 0 : 0.3), lineWidth: 1)
                                )
                                .contentShape(Rectangle()) // 🛡️ Tıklama alanı tamamını kapsasın
                                .onTapGesture {
                                    toggleDay(day)
                                }
                        }
                    }
                    .padding(.vertical, 4)
                }


                // ⏰ Hatırlatıcı
                Section {
                    Toggle("Reminder", isOn: $reminderEnabled)

                    if reminderEnabled {
                        DatePicker("Time", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    }
                }

                // 💾 Kaydet Butonu
                Section {
                    Button(action: {
                        viewModel.addHabit(
                            title: title,
                            repeatDays: Array(selectedDays),
                            date: selectedTime
                        )
                        resetForm()
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

    // ✅ Tam burada!
       func toggleDay(_ day: String) {
           if selectedDays.contains(day) {
               selectedDays.remove(day)
           } else {
               selectedDays.insert(day)
           }
           print("Selected Days: \(selectedDays)")
       }
    
    // 🔄 Formu sıfırla
    func resetForm() {
        title = ""
        selectedDays.removeAll()
        reminderEnabled = false
        selectedTime = Date()
    }
    
}


#Preview {
    AddHabitView()
        .environmentObject(HabitViewModel())
}
