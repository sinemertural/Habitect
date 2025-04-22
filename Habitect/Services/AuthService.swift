//
//  AuthService.swift
//  Habitect
//
//  Created by Sinem Ertural on 22.04.2025.
//

import Foundation
import FirebaseAuth

class AuthService: ObservableObject {
    static let shared = AuthService()

    @Published var user: User?

    private init() {
        self.user = Auth.auth().currentUser
    }

    func register(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.user = result?.user
                completion(.success(()))
            }
        }
    }

    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.user = result?.user
                completion(.success(()))
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Çıkış işlemi başarısız: \(error.localizedDescription)")
        }
    }
}

