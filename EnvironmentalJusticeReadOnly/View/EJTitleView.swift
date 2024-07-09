//
//  ejTitleTwo.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import SwiftUI

struct EJTitleView: View {
    var body: some View {
        Text("EcoJustice")
            .font(.title2)
            .foregroundColor(.black)
            .padding()
            .opacity(0.85)
            .background(Color.white)
            .cornerRadius(7)
            .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
    }
}

struct EJTitleView_Previews: PreviewProvider {
    static var previews: some View {
        EJTitleView()
    }
}
