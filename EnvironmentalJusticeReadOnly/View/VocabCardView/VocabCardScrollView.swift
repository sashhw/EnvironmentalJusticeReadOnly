import SwiftUI

struct VocabCardScrollView: View {
    @StateObject var viewModel = VocabCardViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Image("dam-edited")
                    .opacity(0.6)
                    .backgroundImageStyle()
                VStack {
                    Text("EcoJustice Terms")
                        .kerning(0.5)
                        .foregroundColor(Color.white)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .opacity(0.8)
                                .frame(width: 235, height: 45)
                                .foregroundColor(Color.black)
                        )
                        .padding(.bottom, 110)
                        .padding(.top, 20)
                    
                    if #available(iOS 17.0, *) {
                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .center, spacing: 30) {
                                ForEach(viewModel.cards, id: \.self) { card in
                                    VocabCardComponent(viewModel: viewModel, card: card)
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .safeAreaPadding(.horizontal, 40)
                        
                    } else {
                        LazyHStack(alignment: .center, spacing: 30) {
                            ForEach(viewModel.cards, id: \.self) { card in
                                VocabCardComponent(viewModel: viewModel, card: card)
                            }
                        }
                        .modifier(
                            ScrollingStackModifier(items: viewModel.cards, itemWidth: 300, itemSpacing: 30)
                        )
                    }
                }
                .padding(.bottom)
            }
            Spacer()
            
            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffleCards()
                }
            }
            .background(
                RoundedRectangle(cornerRadius: 3)
                    .frame(width: 90, height: 30)
                    .foregroundColor(Color.black)
            )
            .foregroundColor(.white)
            .opacity(0.85)
            
            Spacer(minLength: 250)
        }
    }
}

