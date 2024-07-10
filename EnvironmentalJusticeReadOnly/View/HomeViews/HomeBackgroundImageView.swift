//
//  HomeBackgroundImageView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/10/24.
//

import SwiftUI

struct HomeBackgroundImageView: View {
    var body: some View {
        Image("dam-edited")
            .resizable()
            .scaledToFill()
            .opacity(0.4)
            .edgesIgnoringSafeArea(.all)
    }
}
