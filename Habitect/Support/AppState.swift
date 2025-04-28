//
//  AppState.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI
import Foundation

class AppState: ObservableObject {
    @Published var hasSeenWelcome: Bool = false
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
}

// ✨ Notification extension
extension Notification.Name {
    static let didLogin = Notification.Name("didLogin")
}

//uygulamaya devam edeceğim kısımdayım.
