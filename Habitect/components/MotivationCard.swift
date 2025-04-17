//
//  MotivationCard.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct MotivationCard: View {
    let message: String = "Small habits make a big difference. 🚀"

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💡 Motivation")
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))

            Text(message)
                .font(.body)
                .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(hex: "#4361EE"), Color(hex: "#5E60CE")]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    MotivationCard()
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.black)
}
