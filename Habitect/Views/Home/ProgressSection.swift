//
//  ProgressSection.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI


struct ProgressSection: View {
    var completionRate: Double // 💡 Dışarıdan oran al

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Today's Progress")
                .font(.headline)
                .foregroundColor(.white)

            ZStack {
                Circle()
                    .stroke(lineWidth: 20)
                    .opacity(0.2)
                    .foregroundColor(.white)

                Circle()
                    .trim(from: 0.0, to: completionRate)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.white)
                    .rotationEffect(Angle(degrees: -90))
                    .animation(.easeOut(duration: 0.8), value: completionRate)

                VStack {
                    Text("\(Int(completionRate * 100))%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    Text("completed")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .frame(width: 160, height: 160)
            .padding(.top, 10)
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(hex: "#5E60CE"))
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 4)
    }
}

#Preview {
    ProgressSection(completionRate: 0.65)
        .preferredColorScheme(.dark)
        .padding()
        .background(Color.black)
}

