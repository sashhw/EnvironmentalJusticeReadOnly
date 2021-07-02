//
//  CiteSheetView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/29/21.
//

import SwiftUI

struct CiteSheetView: View {
    var body: some View {
        ScrollView {
        VStack {
          
            Text("Citations")
                .font(.title2)
                .padding()
            Text(citations)
                .font(.caption)
        }
        .padding()
    }
}
}
struct CiteSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CiteSheetView()
    }
}
