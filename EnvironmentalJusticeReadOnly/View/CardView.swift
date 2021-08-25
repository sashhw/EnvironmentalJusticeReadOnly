//
//  PicView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/3/21.
//

import SwiftUI

struct CardView: View {
//    var definitions = ["redlining": redlining,
//                       "equal protection clause": equalProtectionClause,
//                       "EPA": epa,
//                       "pesticide": pesticide,
//                       "contamination": contamination,
//                       "strike": strike
//    ]
    
//    var cardsArray: [Card] = [
//        Card(word: "redlining", definition: redlining),
//        Card(word: "Equal Protection Clause", definition: equalProtectionClause),
//        Card(word: "EPA", definition: epa),
//        Card(word: "pesticide", definition: pesticide),
//        Card(word: "contamination", definition: contamination),
//        Card(word: "strike", definition: strike)
//    ]
    let dict: [String: String] = [
        "redlining": redlining,
        "Equal Protection Clause": equalProtectionClause,
        "EPA": epa,
        "pesticide": pesticide,
        "contamination": contamination,
        "strike": strike,
        "boycott": boycott,
        "racial segregation": racialSegregation,
        "Court of Appeals": courtOfAppeals,
        "PCBs": pcb,
        "detoxification": detoxification,
        "sewage": sewage,
        "carcinogen": carcinogen,
        "Superfund": superfund,
        "equity": equity,
        "gentrification": gentrification,
        "autonomy": autonomy,
        "reparation": reparation
    ]
    let card: Card
    var removal: (() -> Void)? = nil

    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0
    
    var body: some View {
        
        let keys = dict.map{$0.key}
        let values = dict.map {$0.value}
      
        ZStack {
            Image("gray")
                .opacity(0.4)
        VStack {
            
            Text("Environmental Justice Terms")
                .font(.title2)
                .padding(.bottom, 100)
            
            ScrollView(.horizontal, showsIndicators: true) {
    HStack {
        
            ForEach(keys.indices) {index in
            
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.white)
                .shadow(radius: 10)
                .rotation3DEffect(self.isShowingAnswer ? Angle(degrees: 180): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .animation(.default)
            VStack {
        
//                Text(keys[index])
//                    .font(.title2)
//                    .foregroundColor(.black)
//                    .padding()
           
                if isShowingAnswer {
                Text(values[index])
                    .font(.body)
                    .italic()
                    .foregroundColor(.black)
                    .padding()
            }
                else {
                   
            VStack {
                Text(keys[index])
                    .font(.title2)
                    .foregroundColor(.black)
              
                Text("Tap for definition")
                    .font(.body)
                    .opacity(0.6)
                    .foregroundColor(.black)
                    .padding()
                    }
                }
            }
            }
        
            .padding(20)
            .multilineTextAlignment(.center)
        }
    
        .frame(width: 400, height: 250, alignment: .center)
//        .rotationEffect(.degrees(Double(offset .width / 5)))
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
//        .gesture(
//            DragGesture()
//                .onChanged {
//                    gesture in
//                    self.offset = gesture.translation
//                }
//                .onEnded { _ in
//                    if abs(self.offset.width) > 100 {
//                        self.removal?()
//                    } else {
//                        self.offset = .zero
//                    }
//                }
//                )
    }
        .onTapGesture {
//            self.isShowingAnswer.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                self.isShowingAnswer.toggle()
            }
            flipFlashcard()
    }
            .animation(.easeInOut(duration: 0.5))
            .padding(.leading, 300)
            .padding(.trailing, 300)
//            .animation(.linear(duration: 0.5), value: 180)
        }
            
            }
        .padding(.bottom, 300)
        .padding(.top, 100)
            
            
    }

        
    }
    func flipFlashcard() {
        let animationTime = 1.0
        withAnimation(.easeInOut(duration: animationTime)) {
            flashcardRotation += 180
            isShowingAnswer.toggle()
        }
//        withAnimation(Animation.linear(duration: 0.001).delay(animationTime / 2)) {
//            contentRotation += 360
//            isShowingAnswer.toggle()
//        }
    }
    }


struct PicView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(word: "", definition: ""))
    }
}
