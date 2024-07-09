import Foundation

struct Card: Identifiable, Hashable {
    var word: String
    var definition: String
    var selected: Bool = false
    var id = UUID()
    var wordDef: String {
        selected ? definition : word
    }
    var subCard: [Card]?

    mutating func flipFlashcard() {
        selected.toggle()
    }
}

struct CardsList {
    static let cards: [Card] = [
        Card(word: "redlining", definition: "A discriminatory practice by which banks and insurance companies refuse or limit loans, mortgages, or insurance within specific geographic areas, especially inner-city neighborhoods."),
        Card(word: "Equal Protection Clause", definition: "Part of the Fourteenth Amendment to the United States Constitution which requires that states guarantee the same rights, privileges, and protections to all citizens."),
        Card(word: "EPA", definition: "The Environmental Protection Agency is an independent executive agency of the United States federal government tasked with environmental protection matters."),
        Card(word: "pesticide", definition: "A substance used for destroying insects or other organisms harmful to cultivated plants or to animals."),
        Card(word: "contamination", definition: "The action or state of making or being made impure by polluting or poisoning."),
        Card(word: "strike", definition: "A refusal to work organized by a body of employees as a form of protest."),
        Card(word: "boycott", definition: "Withdraw from commercial or social relations with (a country, organization, or person) as a punishment or protest."),
        Card(word: "racial segregation", definition: "The enforced separation of different racial groups in a country, community, or establishment."),
        Card(word: "Court of Appeals", definition: "A court to which appeals are taken in a federal circuit or a state."),
        Card(word: "PCBs", definition: "Polychlorinated biphenyls are a group of man-made organic chemicals."),
        Card(word: "detoxification", definition: "The process of removing toxic substances or qualities."),
        Card(word: "sewage", definition: "Waste water and excrement conveyed in sewers."),
        Card(word: "carcinogen", definition: "A substance capable of causing cancer in living tissue."),
        Card(word: "Superfund", definition: "A US federal government program designed to fund the cleanup of toxic wastes."),
        Card(word: "equity", definition: "The quality of being fair and impartial."),
        Card(word: "gentrification", definition: "The process of renovating and improving a house or district so that it conforms to middle-class taste."),
        Card(word: "autonomy", definition: "The right or condition of self-government."),
        Card(word: "reparation", definition: "The making of amends for a wrong one has done.")
    ]
}
