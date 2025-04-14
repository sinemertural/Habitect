//
//  OnboardingPageView.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

struct OnboardingPageView: View {
    let title: String
    let subtitle: String
    let imageName: String
    var showStartButton: Bool = false
    
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                LinearGradient.mainBackgroundGradient
                      .ignoresSafeArea()

                VStack(spacing: 30) {
                    Spacer()

                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .foregroundColor(.white)

                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Text(subtitle)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    Spacer()

                    if showStartButton {
                        Button(action: {
                            withAnimation(.easeInOut){
                                hasSeenOnboarding = true
                                }
                        }) {
                            Text("Get Started")
                                .font(.headline)
                                .foregroundColor(Color(hex: "#3A0CA3"))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20)
                                .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                                .padding(.horizontal, 40)
                        }

                        Spacer().frame(height: 40)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height) // ✅ Tüm ekranı kapla
            }
        }
    }
}
