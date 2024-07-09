//
//  CaseCellView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/9/24.
//

import SwiftUI

@available(iOS 17, *)
struct CaseCellView: View {
    var event: Event
    @ObservedObject var caseCellVM: CaseCellViewModel
    @State var ejCase: String = ""
    
    var body: some View {
        HStack {
            Text(event.name)
                .kerning(0.25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.subheadline)
                .frame(width: 200)

            NavigationLink(destination: CaseDetailView()) {
                Text("")
            }
        }
    }
}
