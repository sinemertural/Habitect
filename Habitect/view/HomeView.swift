//
//  HomeView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // 👋 Hoş geldin mesajı
                    Text("Good Morning, Sinem 👋")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)

                    // 📈 Bugünün ilerlemesi
                    ProgressSection()

                    // ✅ Aktif alışkanlıklar listesi
                    HabitsListSection()

                    // 🆕 Yeni alışkanlık önerisi veya motivasyonel söz
                    MotivationCard()

                }
                .padding()
            }
            .navigationTitle("Today")
        }
    }
}


#Preview {
    HomeView()
}
