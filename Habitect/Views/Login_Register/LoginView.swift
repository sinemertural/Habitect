//
//  LoginView.swift
//  Habitect
//
//  Created by Sinem Ertural on 22.04.2025.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                Spacer()

                Text("Welcome Back 👋")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                VStack(spacing: 16) {
                    // ✉️ Email Field
                    TextField("Email", text: $email)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)

                    // 🔒 Password Field
                    HStack {
                        if showPassword {
                            TextField("Password", text: $password)
                        } else {
                            SecureField("Password", text: $password)
                        }

                        Button(action: {
                            showPassword.toggle()
                        }) {
                            Image(systemName: showPassword ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }

                // 🔴 Hata Mesajı
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.caption)
                }

                // ✅ Login Butonu
                Button(action: {
                    handleLogin() // Firebase üzerinden giriş yapılacak
                }) {
                    Text("Login")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }

                // 🔁 Hesabın yok mu?
                HStack {
                    Text("Don't have an account?")
                    NavigationLink("Sign up", destination: RegisterView())
                        .fontWeight(.semibold)
                }
                .font(.footnote)

                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
    }

    // 📦 Basit Giriş Doğrulama (şimdilik)
    func handleLogin() {
        errorMessage = nil

        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Email and password are required."
            return
        }

        AuthService.shared.login(email: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    appState.isLoggedIn = true
                case .failure(let error):
                    errorMessage = error.localizedDescription
                }
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AppState())
}
