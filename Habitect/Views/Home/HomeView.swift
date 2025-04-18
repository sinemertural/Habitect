//
//  HomeView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject var habitViewModel: HabitViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Good Morning, Sinem 👋")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top)

                    // 🔥 Bugüne özel progress oranı
                    ProgressSection(completionRate: habitViewModel.completionRateForToday())

                    HabitsListSection(
                        habits: habitViewModel.habitsForToday(),
                        viewModel: habitViewModel
                    )

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
        .environmentObject(HabitViewModel()) // Preview için dummy veriler
}
