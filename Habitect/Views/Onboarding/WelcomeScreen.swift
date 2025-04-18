//
//  WelcomeScreen.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

struct WelcomeScreen: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            LinearGradient.mainBackgroundGradient
                  .ignoresSafeArea()
          

            VStack(spacing: 24) {
                Spacer()
                Text("Habitect")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Design your better self.")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))

                Spacer()

                Button(action: {
                    withAnimation {
                        appState.hasSeenWelcome = true
                    }
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .foregroundColor(Color(hex: "#3A0CA3"))
                        .cornerRadius(16)
                        .padding(.horizontal, 40)
                }

                Spacer().frame(height: 40)
            }
        }
    }
}

#Preview {
    WelcomeScreen()
}
