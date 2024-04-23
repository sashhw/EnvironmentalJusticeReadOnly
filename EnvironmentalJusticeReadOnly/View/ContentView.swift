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
    let usCases = USCasesListView()
    let ejTitleView = EJTitleView()
    let cardScrollView = CardScrollView()
    let newMapView = NewMapView()
    let citeSheetView = CiteSheetView()

    var body: some View {
        NavigationView {
            ZStack {
                Image("dam-edited")
                    .opacity(110)
                    .backgroundImageStyle()

                Group {
                    Spacer()
                    VStack {
                        ejTitleView
                            .padding(.bottom, 100)
                        VStack {
                            if flipped {
                                VStack(alignment: .leading) {
                                    Text(ejDef)
                                        .kerning(0.5)
                                        .italic()
                                        .multilineTextAlignment(.leading)

                                    HStack {
                                        Text("- U.S. EPA")
                                            .kerning(0.5)
                                            .multilineTextAlignment(.leading)
                                            .padding(.top, 10)

                                        Spacer()

                                        Text("Dismiss")
                                            .kerning(1.0)
                                            .fontWeight(.light)
                                            .font(.footnote)
                                            .foregroundColor(.black)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1)
                                                    .frame(width: 65, height: 20)
                                            )
                                            .padding(.bottom, -20)
                                            .onTapGesture {
                                                flipped = false
                                            }
                                    }
                                }
                                .homeButtonStyle()
                                .font(.body)
                                .frame(width: 200, height: 500)
                            } else {
                                Text("Info")
                                    .kerning(2.0)
                                    .homeButtonStyle()
                            }
                        }
                        .onTapGesture {
                            flipped = true
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
                    .padding(.bottom, 200.0)

                    .navigationBarItems(
                        trailing:
                            Button(
                                action: { self.showSheetView.toggle() }
                            ){
                                Image(systemName: "info.circle")
                                    .font(Font.system(.caption))
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                    .opacity(0.5)
                            }
                    )
                    Spacer()
                }
                .rotation3DEffect(
                    self.flipped
                    ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0))
                )
                .animation(.default)
            }
        }
        .frame(maxWidth: .infinity)
        .sheet(isPresented: $showSheetView) {
            citeSheetView
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
