//
//  CardModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/23/21.
//

import Foundation

struct Card {
    var word: String
    var definition: String
    static var example: Card {
        Card(word: "redlining", definition: redlining)
    }
}


