//
//  ContentView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State private var flipped = false
    @State private var showSheetView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                HomeBackgroundImageView()
                VStack {
                    Spacer()
                    if flipped {
                        InfoPopupView(hideDefinition: {
                            self.flipped.toggle()
                        })
                    } else {
                        MainContentView(flipped: $flipped, showSheetView: $showSheetView)
                    }
                    Spacer()
                }
                .padding(.bottom, 100)
                .navigationBarItems(
                    trailing:
                        Button(action: { self.showSheetView.toggle() }) {
                            Image(systemName: "info.circle")
                                .font(.caption)
                                .foregroundColor(.black)
                                .opacity(0.5)
                        }
                )
            }
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $showSheetView) {
                CiteSheetView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
