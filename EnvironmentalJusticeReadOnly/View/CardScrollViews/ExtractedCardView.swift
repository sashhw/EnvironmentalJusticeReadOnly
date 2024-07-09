//
//  ExtractedCardView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/9/24.
//

import SwiftUI

struct ExtractedCardView: View {
    var cardName: String

    var body: some View {
        Text(cardName)
            .kerning(1.0)
            .font(.headline)
            .fontWeight(.light)
            .foregroundColor(.black)
            .padding()
            .frame(width: 300, height: 200, alignment: .center)
            .cornerRadius(10)
            .background(RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color.white))
            .shadow(color: .gray, radius: 10)
    }
}

