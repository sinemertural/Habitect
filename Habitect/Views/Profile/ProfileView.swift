//
//  ProfileView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                Spacer()

                Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)

                Text("Sinem Ertural")
                    .font(.title2)
                    .fontWeight(.semibold)

                Spacer()

                Button(action: {
                    withAnimation {
                        AuthService.shared.signOut()
                        appState.isLoggedIn = false
                    }
                }) {
                    Label("Log Out", systemImage: "arrow.backward.circle")
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AppState())
}


//fdklgfkld
