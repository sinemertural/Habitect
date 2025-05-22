//
//  AppState.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI
import Foundation

/// Represents the global state of the application.
final class AppState: ObservableObject {
    
    // MARK: - Published Properties
    
    /// Indicates whether the user has seen the welcome screen (for temporary use within the app lifecycle).
    @Published var hasSeenWelcome: Bool = false

    /// Indicates whether the user has completed the onboarding process.j
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    /// Indicates whether the user is currently logged in.
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
}

// MARK: - Notification Extension

extension Notification.Name {
    /// Notification posted when a user successfully logs in.
    static let didLogin = Notification.Name("didLogin")
}
