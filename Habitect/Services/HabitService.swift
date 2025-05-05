//
//  HabitService.swift
//  Habitect
//
//  Created by Sinem Ertural on 26.04.2025.
//

import Foundation
import FirebaseFirestore

class HabitService {
    static let shared = HabitService() // Singleton yapı

    private let db = Firestore.firestore()

    private init() {}

    // 🔵 Kullanıcının UID'sini almak
    private var userId: String? {
        return AuthService.shared.user?.uid
    }

    // 🔵 Alışkanlık ekleme
    func addHabit(_ habit: Habit, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userId = userId else { return }

        do {
            let habitData = try habit.toDictionary()
            db.collection("users").document(userId).collection("habits").document(habit.id.uuidString).setData(habitData) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        } catch {
            completion(.failure(error))
        }
    }

    // 🔵 Alışkanlıkları çekme
    func fetchHabits(completion: @escaping (Result<[Habit], Error>) -> Void) {
        guard let userId = userId else { return }

        db.collection("users").document(userId).collection("habits").getDocuments { snapshot, error in
            if let error = error {
                completion(.failure(error))
            } else {
                let habits = snapshot?.documents.compactMap { doc -> Habit? in
                    return try? doc.data().toObject(Habit.self)
                } ?? []
                completion(.success(habits))
            }
        }
    }
    
    func updateHabit(_ habit: Habit, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userId = userId else { return }

        do {
            let updatedData = try habit.toDictionary()
            db.collection("users")
                .document(userId)
                .collection("habits")
                .document(habit.id.uuidString)
                .setData(updatedData, merge: true) { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
        } catch {
            completion(.failure(error))
        }
    }

    
    func observeHabits(completion: @escaping (Result<[Habit], Error>) -> Void) {
        guard let userId = userId else { return }

        db.collection("users").document(userId).collection("habits")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    let habits = snapshot?.documents.compactMap { doc -> Habit? in
                        return try? doc.data().toObject(Habit.self)
                    } ?? []
                    completion(.success(habits))
                }
            }
    }


    // 🔵 Alışkanlık silme
    func deleteHabit(_ habit: Habit, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let userId = userId else { return }

        db.collection("users").document(userId).collection("habits").document(habit.id.uuidString).delete { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
