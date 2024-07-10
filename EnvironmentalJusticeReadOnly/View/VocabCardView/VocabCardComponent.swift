import SwiftUI

struct VocabCardComponent: View {
    @ObservedObject var viewModel: VocabCardViewModel
    var card: Card
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white)
                .frame(width: 300, height: 200, alignment: .center)
                .shadow(color: .gray, radius: 10)
                .rotation3DEffect(
                    .degrees(viewModel.isCardFlipped(card) ? 180 : 0),
                    axis: (x: 0, y: 1, z: 0)
                )
            
            Text(viewModel.isCardFlipped(card) ? card.definition : card.word)
                .kerning(1.0)
                .font(.headline)
                .fontWeight(.light)
                .foregroundColor(.black)
                .padding(.horizontal, 12)
            
        }
        .onTapGesture {
            withAnimation {
                viewModel.flipCard(card)
            }
        }
    }
}
