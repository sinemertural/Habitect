//
//  MainTabView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.bar.fill")
                }

            AddHabitView()
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }

            RemindersView()
                .tabItem {
                    Label("Reminders", systemImage: "bell.fill")
                }

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
    }
}


#Preview {
    MainTabView()
}


//ldkfsdfjhjkhh
