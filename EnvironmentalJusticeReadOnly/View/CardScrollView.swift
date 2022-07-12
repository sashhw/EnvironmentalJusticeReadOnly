//
//  MockCardView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/12/22.
//

import SwiftUI


struct ScrollingStackModifier: ViewModifier {

    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat

    var items: [Card]
    var itemWidth: CGFloat
    var itemSpacing: CGFloat

    init(items: [Card], itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing

        let contentWidth: CGFloat = CGFloat(items.count) * itemWidth + CGFloat(items.count - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width

        let initialOffset = (contentWidth / 2.0) - (screenWidth / 2.0) + ((screenWidth - itemWidth) / 2.0)

        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)

    }

    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged({ event in dragOffset = event.translation.width })
                .onEnded({ event in
                    scrollOffset += event.translation.width
                    dragOffset = 0

                    let contentWidth: CGFloat = CGFloat(items.count) * itemWidth + CGFloat(items.count - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width

                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)

                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)

                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }

                    index = min(index, CGFloat(items.count) - 1)
                    index = max(index, 0)

                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing

                    withAnimation {
                        scrollOffset = newOffset
                    }
                })
            ) }
}

struct CardScrollView: View {
    @State var showDef = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0

    init() {
        UITableView.appearance().backgroundColor = .white
    }

    var cards: [Card] = [
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

    var body: some View {
        ZStack {
            Image("dam-edited")
                .opacity(0.3)
                .scaledToFit()
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.width,
                    alignment: .center
                )
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(Color.black)
                    .opacity(0.65)
                    .frame(width: 235, height: 45, alignment: .center)

                Text("EcoJustice Terms")
                    .kerning(2.0)
                    .foregroundColor(Color.white)
                    .font(.title2)
            }
            .padding(.bottom, 130)

            HStack(alignment: .center, spacing: 30) {
                ForEach(cards, id: \.self){ card in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 10)
                            .frame(width: 300, height: 200, alignment: .center)

                        if showDef {
                            Text(card.definition)
                                .kerning(1.0)
                                .font(.headline)
                                .fontWeight(.light)
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 300, height: 200, alignment: .center)
                                .cornerRadius(10)

                        } else {
                            VStack {
                                Text(card.word)
                                    .kerning(1.0)
                                    .font(.title3)
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                Text("Tap for definition")
                                    .kerning(1.0)
                                    .font(.caption)
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                    .padding()
                            }
                            .frame(width: 300, height: 200, alignment: .center)
                        }
                    }
                    .onTapGesture {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                            self.showDef.toggle()
                        }
                        flipFlashcard()
                    }
                }
                .modifier(ScrollingStackModifier(items: cards, itemWidth: 300, itemSpacing: 30))
            }
            .padding(.bottom)

            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .foregroundColor(Color.black)
                    .opacity(0.8)
                    .frame(width: 90, height: 30)
                Text("Shuffle")
                    .kerning(2.0)
                    .foregroundColor(Color.white)
                    .font(.caption)
                    .shadow(color: .black, radius: 3)
                    .cornerRadius(5)
            }
            Spacer()
        }
        }
    }

    func flipFlashcard() {
        let animationTime = 1.0
        withAnimation(.easeInOut(duration: animationTime)) {
            flashcardRotation += 180
            showDef.toggle()
        }
    }

}
