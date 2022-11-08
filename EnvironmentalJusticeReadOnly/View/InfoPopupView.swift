//
//  InfoPopupView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 11/2/22.
//

import SwiftUI

struct InfoPopupView: View {
    let contentView = ContentView()

    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .trailing) {
                    Text(ejDef)
                        .kerning(0.5)
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .homeButtonStyle()
                }
                Button {
                    contentView.flipped.toggle()
                } label: {
                    Text("Dismiss")
                        .kerning(2.0)
                        .fontWeight(.light)
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(.all, 3)
                        .border(Color.black, width: 0.5)
                        .scaleEffect(0.9)
                        .cornerRadius(6)
                        .padding(.leading, 200)
                        .frame(alignment: .bottom)
                        .padding(.bottom, 250)
                }
            }
        }
    }
}

struct InfoPopupView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPopupView()
    }
}
