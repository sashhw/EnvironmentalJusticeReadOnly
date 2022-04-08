//
//  File.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/8/22.
//

import SwiftUI

struct MockCardView: View {
    let cards: [Card] = [
        Card(word: "redlining", definition: redlining),
        Card(word: "Equal Protection Clause", definition: equalProtectionClause),
        Card(word: "EPA", definition: epa),
        Card(word: "pesticide", definition: pesticide),
        Card(word: "contamination", definition: contamination),
        Card(word: "strike", definition: strike),
        Card(word: "boycott", definition: boycott),
        Card(word: "racial segregation", definition: racialSegregation),
        Card(word: "Court of Appeals", definition: courtOfAppeals),
        Card(word: "PCBs", definition: pcb),
        Card(word: "detoxification", definition: detoxification),
        Card(word: "sewage", definition: sewage),
        Card(word: "carcinogen", definition: carcinogen),
        Card(word: "Superfund", definition: superfund),
        Card(word: "equity", definition: equity),
        Card(word: "gentrification", definition: gentrification),
        Card(word: "autonomy", definition: autonomy),
        Card(word: "reparation", definition: reparation)
    ]

    var body: some View {
        ForEach(cards) { card in
            Text(card.word)
        }

    }
}

struct MockCardView_Previews: PreviewProvider {
    static var previews: some View {
        MockCardView()
    }
}

