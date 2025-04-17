//
//  ProfileView.swift
//  Habitect
//
//  Created by Sinem Ertural on 17.04.2025.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack(spacing: 16) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.primaryColor)

                        VStack(alignment: .leading) {
                            Text("Sinem Ertural")
                                .font(.headline)
                            Text("sinem@example.com")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 8)
                }

                Section(header: Text("Settings")) {
                    NavigationLink(destination: Text("Account Settings")) {
                        Label("Account", systemImage: "person.circle")
                    }

                    NavigationLink(destination: Text("Notifications")) {
                        Label("Notifications", systemImage: "bell")
                    }

                    NavigationLink(destination: Text("Privacy Policy")) {
                        Label("Privacy", systemImage: "lock")
                    }
                }

                Section {
                    Button(action: {
                        // Çıkış işlemi burada olacak
                    }) {
                        Label("Log Out", systemImage: "arrow.backward.circle")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
