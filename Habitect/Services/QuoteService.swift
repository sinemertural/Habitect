//
//  QuoteService.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation

class QuoteService {
    static let shared = QuoteService()

    func fetchRandomQuote(completion: @escaping (Quote?) -> Void) {
        guard let url = URL(string: "https://zenquotes.io/api/random") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([Quote].self, from: data)
                    completion(decoded.first)
                } catch {
                    print("Decoding error:", error)
                    completion(nil)
                }
            } else {
                print("Network error:", error?.localizedDescription ?? "Unknown error")
                completion(nil)
            }
        }.resume()
    }
}
