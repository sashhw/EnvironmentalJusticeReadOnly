//
//  BackgroundImageModifier.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 8/11/22.
//

import Foundation
import SwiftUI

struct BackgroundImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(
                width: UIScreen.main.bounds.width,
                height: UIScreen.main.bounds.width,
                alignment: .center
            )
    }
}
