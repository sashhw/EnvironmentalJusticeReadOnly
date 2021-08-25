////
////  MainCardVIew.swift
////  EnvironmentalJusticeReadOnly
////
////  Created by Sasha on 8/23/21.
////
//
//import SwiftUI
//
//extension View {
//    func stacked(at position: Int, in total: Int) -> some View {
//        let offset = CGFloat(total - position)
//        return self.offset(CGSize(width: 0, height: offset * 10))
//    }
//}
//
//struct MainCardView: View {
//    @State var dict: [String: String] = ["redlining": redlining, "Equal Protection Clause": equalProtectionClause, "EPA": epa, "pesticide": pesticide, "contamination": contamination, "strike": strike]
//    @State private var cards
//        = [Card](repeating: Card.example, count: 10)
//    @State private var isActive = false
//    var body: some View {
//        ZStack {
//            Image("backgroundTwo")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
//                .opacity(0.2)
//            VStack {
//                Text("Environmental Justice Definitions")
//                    .font(.title)
//                    .multilineTextAlignment(.center)
//                    .padding(.bottom, 150)
//                    .padding(.top, 90)
//                    .padding()
//                ZStack {
//                    ForEach(0..<cards.count, id: \.self) {
//                        index in
//                        CardView(card: self.cards[index]) {
//                            withAnimation {
//                                self.removeCard(at: index)
//                            }
//                        }
//                            .stacked(at: index, in: self.cards.count)
//                    }
//                }
//                if cards.isEmpty {
//                    Button("Start Again", action: resetCards)
//                        .padding()
//                        .background(Color.white)
//                        .clipShape(Capsule())
//                }
//            }
//        }
//    }
//    func removeCard(at index: Int) {
//        cards.remove(at: index)
//        if cards.isEmpty {
//            isActive = false
//        }
//    }
//    func resetCards() {
//        cards = [Card](repeating: Card.example, count: 10)
//        isActive = true
//    }
//}
//
//struct MainCardVIew_Previews: PreviewProvider {
//    static var previews: some View {
//        MainCardView()
//    }
//}
