//
//  MotivationCardViewModel.swift
//  Habitect
//
//  Created by Sinem Ertural on 18.04.2025.
//

import Foundation

class MotivationCardViewModel: ObservableObject {
    @Published var quote: Quote?

    func loadQuote() {
        QuoteService.shared.fetchRandomQuote { [weak self] fetchedQuote in
            DispatchQueue.main.async {
                self?.quote = fetchedQuote
            }
        }
    }
}
