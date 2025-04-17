//
//  ProgressView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // 🔢 Genel istatistikler
                    Text("Your Progress")
                        .font(.title)
                        .fontWeight(.bold)

                    HStack(spacing: 16) {
                        ProgressStatBox(title: "Streak", value: "12 🔥")
                        ProgressStatBox(title: "Total Habits", value: "8")
                        ProgressStatBox(title: "Completed", value: "72%")
                    }

                    // 📊 Grafik (placeholder - daha sonra eklenecek)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Weekly Overview")
                            .font(.headline)
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.secondary.opacity(0.1))
                            .frame(height: 180)
                            .overlay(Text("📊 Chart coming soon").foregroundColor(.secondary))
                    }
                }
                .padding()
            }
            .navigationTitle("Progress")
        }
    }
}

struct ProgressStatBox: View {
    let title: String
    let value: String

    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primaryColor)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ProgressView()
}
