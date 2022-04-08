//
//  CardModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/23/21.
//

import Foundation

struct Card: Identifiable {
    var word: String
    var definition: String
    var id = UUID()
}


