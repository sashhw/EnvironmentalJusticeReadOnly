//
//  HomeScreenButtonModifier .swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 8/11/22.
//

import Foundation
import SwiftUI

struct HomeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.headline).weight(.light))
            .padding()
            .background(Color.white.cornerRadius(7))
            .scaleEffect(0.9)
            .foregroundColor(.black)
            .multilineTextAlignment(.center)
            .opacity(0.85)
            .padding(.horizontal, 30.0)
            .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
    }
}
