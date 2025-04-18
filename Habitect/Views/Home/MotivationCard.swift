//
//  MotivationCard.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct MotivationCard: View {
    @StateObject private var viewModel = MotivationCardViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("💡 Motivation")
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))

            if let quote = viewModel.quote {
                Text("“\(quote.q)”")
                    .font(.body)
                    .foregroundColor(.white)

                Text("- \(quote.a)")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            }
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
        .onAppear {
            viewModel.loadQuote()
        }
    }
}


#Preview {
    MotivationCard()
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.black)
}
