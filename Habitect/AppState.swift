//
//  AppState.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasSeenWelcome: Bool = false
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
}
