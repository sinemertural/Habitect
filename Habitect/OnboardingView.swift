//
//  OnboardingView.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//
import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardingPageView(
                title: "Track Your Habits",
                subtitle: "Eylemlerini düzenli olarak takip et, alışkanlık haline getir.",
                imageName: "calendar.badge.clock"
            )
            OnboardingPageView(
                title: "Build Streaks",
                subtitle: "Kırmadan ilerle, kendini motive et.",
                imageName: "flame.fill"
            )
            OnboardingPageView(
                title: "Grow Every Day",
                subtitle: "Her gün %1 daha iyi versiyonun ol.",
                imageName: "leaf.fill",
                showStartButton: true
            )
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .ignoresSafeArea() // 🌈 TAM SAYFA olur artık!
    }
}

#Preview {
    OnboardingView()
}
