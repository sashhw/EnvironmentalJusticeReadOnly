//
//  Home-ButtonStyle.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 8/15/22.
//

import SwiftUI

struct HomeButtonStyle: ButtonStyle {
    let foregroundColor: Color
    let backgroundColor: Color

    init(foregroundColor: Color, backgroundColor: Color) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.headline).weight(.light))
            .foregroundColor(foregroundColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .opacity(0.85)
            .padding(.horizontal, 30.0)
            .padding(15)
            .frame(alignment: .center)
            .shadow(radius: 10)            
    }
}


