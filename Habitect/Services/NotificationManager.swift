//
//  NotificationManager.swift
//  Habitect
//
//  Created by Sinem Ertural on 5.05.2025.
//

import UserNotifications
import Foundation

class NotificationManager {
    static let shared = NotificationManager()

    private init() {}

    // 🔐 Bildirim izni iste
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Bildirim izni verildi.")
            } else if let error = error {
                print("Bildirim izni hatası: \(error.localizedDescription)")
            } else {
                print("Bildirim izni reddedildi.")
            }
        }
    }

    // 🕒 Bildirim planla
    func scheduleDailyNotification(id: String, title: String, body: String, time: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        // Saat bileşenlerini çıkar
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: time)
        let minute = calendar.component(.minute, from: time)

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        // Günlük tekrar
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Bildirim eklenemedi: \(error.localizedDescription)")
            } else {
                print("Bildirim başarıyla planlandı.")
            }
        }
    }
}
