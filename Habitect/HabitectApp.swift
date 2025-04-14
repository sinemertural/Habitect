//
//  HabitectApp.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

@main
struct HabitectApp: App {
    @StateObject var appState = AppState()

    var body: some Scene {
        WindowGroup {
            if appState.hasSeenOnboarding {
                ContentView()
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
