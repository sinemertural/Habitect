//
//  ContentView.swift
//  Habitect
//
//  Created by Sinem Ertural on 14.04.2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var habitViewModel: HabitViewModel

    var body: some View {
        MainTabView()
            .environmentObject(habitViewModel) 
    }
}

#Preview {
    ContentView()
        .environmentObject(HabitViewModel())
}
