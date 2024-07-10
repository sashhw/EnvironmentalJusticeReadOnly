//
//  InfoPopupView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 11/2/22.
//

import SwiftUI

struct InfoPopupView: View {
    var hideDefinition: () -> Void
    
    var body: some View {
        VStack {
            VStack(alignment: .trailing) {
                Text(ejDef)
                    .kerning(0.5)
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .lineLimit(nil)
                    .padding(.all, 20)
                    .homeButtonStyle()
            }
            Button {
                hideDefinition()
            } label: {
                Text("Dismiss")
                    .homeButtonStyle()
            }
        }
    }
}
