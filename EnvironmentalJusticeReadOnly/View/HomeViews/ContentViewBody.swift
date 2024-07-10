//
//  ContentViewBody.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/10/24.
//

import SwiftUI

struct MainContentView: View {
    @Binding var flipped: Bool
    @Binding var showSheetView: Bool
    
    let usCases = USCasesListView()
    let ejTitleView = EJTitleView()
    let cardScrollView = VocabCardScrollView()
    let newMapView = MapView()
    
    var body: some View {
        VStack {
            ejTitleView
                .padding(.bottom, 100)
            
            Button(action: { self.flipped.toggle() }) {
                Text("Info")
                    .kerning(2.0)
                    .homeButtonStyle()
            }
            
            NavigationLink(destination: cardScrollView) {
                Text("Terms")
                    .kerning(2.0)
                    .homeButtonStyle()
            }
            
            NavigationLink(destination: usCases) {
                Text("Cases")
                    .kerning(2.0)
                    .homeButtonStyle()
            }
            
            NavigationLink(destination: newMapView) {
                Text("Map")
                    .kerning(2.0)
                    .homeButtonStyle()
            }
        }
    }
}
