//
//  HabitectApp.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI
import FirebaseCore //dsmfk

@main
struct HabitectApp: App {
    @StateObject var appState = AppState()
    @StateObject var habitViewModel = HabitViewModel()
    
    init() {
            FirebaseApp.configure() // ✅ Firebase'i başlatıyoruz
    }

    var body: some Scene {
        WindowGroup {
            if appState.hasSeenOnboarding {
                if appState.isLoggedIn {
                    ContentView()
                        .environmentObject(appState)
                        .environmentObject(habitViewModel)
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
