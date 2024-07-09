//
//  ContentView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var flipped = false
    @State var showSheetView = false
    let usCases = CasesListView()
    let screenRect = UIScreen.main.bounds
    let ejTitleView = EJTitleView()

    var body: some View {
        NavigationView {
            ZStack {
                Image("dam-edited")
                    .opacity(110)
                    .backgroundImageStyle()

                    .overlay(
                        Group {
                            Spacer()
                            
                            VStack {
                                ejTitleView
                                    .padding(.bottom, 100)
                                
                                Button {
                                    flipped.toggle()
                                } label: {
                                    Text("Info")
                                        .kerning(2.0)
                                        .homeButtonStyle()
                                }
                                
                                if flipped {
                                    InfoPopupView()
                                }
                                
                                NavigationLink(destination: CardScrollView()) {
                                    Text("Terms")
                                        .kerning(2.0)
                                        .homeButtonStyle()
                                }
                                
                                NavigationLink(destination: usCases) {
                                    
                                    Text("Cases")
                                        .kerning(2.0)
                                        .homeButtonStyle()
                                }
                                
                                NavigationLink(destination: NewMapView()) {
                                    Text("Map")
                                        .kerning(2.0)
                                        .homeButtonStyle()
                                }
                            }
                            .padding(.bottom, 200.0)
                            
                            .navigationBarItems(trailing:
                                                    Button(action: {
                                self.showSheetView.toggle()
                            }){
                                Image(systemName: "info.circle")
                                    .font(Font.system(.caption))
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                    .opacity(0.5)
                            }
                            )
                            Spacer()
                        }
                            .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                            .animation(.default)
                        
                        , alignment: .center
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $showSheetView) {
            CiteSheetView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
