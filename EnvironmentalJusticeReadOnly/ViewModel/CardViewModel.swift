//
//  CardViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/12/22.
//

import Foundation

class CardViewModel: ObservableObject {
    @Published var cards: [Card] = CardsList.cards

    func shuffleCards() {
        cards.shuffle()
    }

    func flipCard(_ card: Card) {
        if let index = cards.firstIndex(of: card) {
            cards[index].selected.toggle()
        }
    }
}

extension RandomAccessCollection {
    func indexed() -> NoteCardViewModel<Self> {
        NoteCardViewModel(base: self)
    }
}

func shuffleTerms() {
    var cards = CardsList().cards
    cards.shuffle()
}
