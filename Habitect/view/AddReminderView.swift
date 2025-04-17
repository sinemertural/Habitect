//
//  AddReminderView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct AddReminderView: View {
    @Environment(\.dismiss) var dismiss

    @State private var title: String = ""
    @State private var time: Date = Date()

    var onSave: (Reminder) -> Void

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reminder Details")) {
                    TextField("Title", text: $title)

                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                }
            }
            .navigationTitle("New Reminder")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newReminder = Reminder(title: title, time: time)
                        onSave(newReminder)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

