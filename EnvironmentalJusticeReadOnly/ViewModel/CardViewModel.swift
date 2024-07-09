//
//  CardViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/12/22.
//

import Foundation

struct NoteCardViewModel<Base: RandomAccessCollection>: RandomAccessCollection {

    typealias Element = (index: Index, element: Base.Element)

    typealias Index = Base.Index

    let base: Base

    var startIndex: Index { base.startIndex }
    var endIndex: Index { base.endIndex }

    func index(after i: Index) -> Index {
        base.index(after: i)
    }

    func index(before i: Index) -> Index {
        base.index(before: i)
    }

    func index(_ i: Index, offsetBy distance: Int) -> Index {
        base.index(i, offsetBy: distance)
    }

    subscript(position: Index) -> Element {
        (index: position, element: base[position])
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
