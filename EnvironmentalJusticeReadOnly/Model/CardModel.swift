import Foundation

struct Card: Identifiable, Hashable {
    var id = UUID()
    var word: String
    var definition: String
    var selected: Bool = false
    var wordDef: String {
        selected ? definition : word
    }

    mutating func flipFlashcard() {
        selected.toggle()
    }
}

struct Item: Identifiable {
    var id = UUID()
    var name: String
}

struct CardsList {
    let cards = [
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
        Card(word: "Court of Appeals", definition: courtOfAppeals),
        Card(word: "detoxification", definition: detoxification),
        Card(word: "sewage", definition: sewage),
        Card(word: "carcinogen", definition: carcinogen),
        Card(word: "Superfund", definition: superfund),
        Card(word: "equity", definition: equity),
        Card(word: "gentrification", definition: gentrification),
        Card(word: "autonomy", definition: autonomy),
        Card(word: "reparation", definition: reparation)
    ]
}
