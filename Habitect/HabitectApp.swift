//
//  HabitectApp.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI
import FirebaseCore //dsdsdsmfk

@main
struct HabitectApp: App {
    @StateObject var appState = AppState()
    @StateObject var habitViewModel = HabitViewModel()
    
    init() {
            NotificationManager.shared.requestAuthorization()
            FirebaseApp.configure() // ✅ Firebase'i başlatıyoruz
    }

    var body: some Scene {
        WindowGroup {
            if appState.hasSeenOnboarding {
                if appState.isLoggedIn {
                    ContentView()
                        .environmentObject(appState)
                        .environmentObject(habitViewModel)
                        .environmentObject(AuthService.shared) // 👈 BU SATIRI EKLE
                } else {
                    LoginView()
                        .environmentObject(appState)
                }
            } else if appState.hasSeenWelcome {
                OnboardingView()
                    .environmentObject(appState)
            } else {
                WelcomeScreen()
                    .environmentObject(appState)
            }
        }
    }
}
