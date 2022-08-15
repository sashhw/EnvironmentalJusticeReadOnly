//
//  Home-ButtonStyle.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 8/15/22.
//

import Foundation
import SwiftUI

struct HomeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(.headline).weight(.light))
            .foregroundColor(.black)
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            .scaleEffect(0.9)
            .multilineTextAlignment(.center)
            .opacity(0.85)
            .padding(.horizontal, 30.0)
            .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
    }
}
