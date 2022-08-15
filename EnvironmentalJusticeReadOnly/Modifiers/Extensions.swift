//
//  Extensions.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 8/11/22.
//

import Foundation
import SwiftUI

extension View {
    func homeButtonStyle() -> some View {
        modifier(HomeButton())
    }
}

extension View {
    func backgroundImageStyle() -> some View {
        modifier(BackgroundImage())
    }
}

//extension View {
//    func homeUsingButtonStyle() -> some View {
//        buttonStyle(HomeButtonStyle())
//    }
//}
