//
//  MockCardView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/12/22.
//

import SwiftUI

struct CardScrollView: View {

    @State private var isShowingAnswer = false
    @State var flashcardRotation = 0.0
    @State var cards = [Card]()

    let screenRect = UIScreen.main.bounds

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack {
                ForEach(cards) { card in
                    ZStack {
                        RoundedRectangle(
                            cornerRadius: 25,
                            style: .continuous)
                        .fill(Color.white)
                        .shadow(radius: 10)
                        if isShowingAnswer {
                            Text(card.definition)
                                .multilineTextAlignment(.center)
                                .padding()
                        } else {
                            Text(card.word)
                        }
                    }
                    .padding()
                }
                .frame(
                    width: screenRect.width-100,
                    height: 300,
                    alignment: .center)
            }
            .onTapGesture {
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    self.isShowingAnswer.toggle()
                }
            }
        }
    }
}
struct MockCardView_Previews: PreviewProvider {
    static var previews: some View {
        CardScrollView()
    }
}

struct CardView: View {
    var body: some View {


    }
}
