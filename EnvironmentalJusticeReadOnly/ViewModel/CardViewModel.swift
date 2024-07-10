//
//  CardViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/12/22.
//

import SwiftUI

class VocabCardViewModel: ObservableObject {
    @Published var cards: [Card]
    @Published var flippedCards: Set<UUID> = []

    init(cards: [Card] = terms) {
        self.cards = cards
    }

    func shuffleCards() {
        cards.shuffle()
    }

    func flipCard(_ card: Card) {
        if flippedCards.contains(card.id) {
            flippedCards.remove(card.id)
        } else {
            flippedCards.insert(card.id)
        }
    }

    func isCardFlipped(_ card: Card) -> Bool {
        flippedCards.contains(card.id)
    }
}
