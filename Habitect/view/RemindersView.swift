//
//  RemindersView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct Reminder: Identifiable {
    let id = UUID()
    let title: String
    let time: Date
}

struct RemindersView: View {
    @State private var reminders: [Reminder] = [
        Reminder(title: "Drink Water", time: Date()),
        Reminder(title: "Read 10 pages", time: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!)
    ]

    @State private var showingAddReminder = false

    var body: some View {
        NavigationView {
            List {
                ForEach(reminders) { reminder in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(reminder.title)
                                .font(.headline)

                            Text(reminder.time, style: .time)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        Image(systemName: "bell")
                            .foregroundColor(.primaryColor)
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: deleteReminder)
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Reminders")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddReminder = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddReminder) {
                AddReminderView { newReminder in
                    reminders.append(newReminder)
                }
            }
        }
    }

    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}


#Preview {
    RemindersView()
}
