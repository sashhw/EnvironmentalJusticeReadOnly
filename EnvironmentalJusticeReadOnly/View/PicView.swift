//
//  PicView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/3/21.
//

import SwiftUI

struct PicView: View {
    var body: some View {
        Image("losal1-1")
            .resizable()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
            .frame(width: 200, height: 200, alignment: .center)
            .aspectRatio(contentMode: .fill)
    }
}

struct PicView_Previews: PreviewProvider {
    static var previews: some View {
        PicView()
    }
}
