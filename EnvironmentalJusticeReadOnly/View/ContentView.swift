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
    let usCases = USCases()
    let screenRect = UIScreen.main.bounds
    let ejTitleText = ejTitle()
    var body: some View {
        NavigationView {
            ZStack {
                Image("spainEnv")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: screenRect.width, height: 1500, alignment: .center)
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 4)
                    .opacity(0.6)
                    .overlay(
                        Group {
                            Spacer()
                            
                            VStack {
                                ejTitleText
                                    .padding(.bottom, 100)
                                
                                Button {
                                    flipped.toggle()
                                } label: {
                                    Text("Info")
                                        .kerning(2.0)
                                        .fontWeight(.light)
                                        .padding()
                                        .font(.system(.headline))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .scaleEffect(0.9)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .opacity(0.7)
                                        .padding(.horizontal, 30.0)
                                        .minimumScaleFactor(0.5)
                                        .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
                                }
                                
                                if flipped {
                                    ZStack {
                                        Text(ejDef)
                                            .fontWeight(.light)
                                            .padding()
                                            .font(.system(.headline))
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                            .scaleEffect(0.9)
                                            .background(Color.white)
                                            .cornerRadius(15)
                                            .opacity(0.7)
                                            .padding(.horizontal, 30.0)
                                            .minimumScaleFactor(0.5)
                                            .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
                                        Button {
                                            flipped.toggle()
                                        } label: {
                                            Text("Dismiss")
                                                .kerning(2.0)
                                                .fontWeight(.light)
                                                .font(.caption)
                                                .bold()
                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                                .border(Color.black, width: 0.5)
                                                .scaleEffect(0.9)
                                                .cornerRadius(15)
                                                .padding(.top, 450)
                                                .padding(.leading, 200)
                                        }
                                    }
                                }
                                
                                NavigationLink(destination: CardScrollView(cards: .init())) {
                                    Text("Terms")
                                        .kerning(2.0)
                                        .fontWeight(.light)
                                        .padding()
                                        .font(.system(.headline))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .scaleEffect(0.9)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .opacity(0.7)
                                        .padding(.horizontal, 30.0)
                                        .minimumScaleFactor(0.5)
                                        .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
                                }
                                
                                NavigationLink(destination: usCases) {
                                    
                                    Text("Cases")
                                        .kerning(2.0)
                                        .fontWeight(.light)
                                        .padding()
                                        .font(.system(.headline))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .scaleEffect(0.9)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .opacity(0.7)
                                        .padding(.horizontal, 30.0)
                                        .minimumScaleFactor(0.5)
                                        .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
                                }
                                
                                NavigationLink(destination: MapViewThree()) {
                                    Text("Map")
                                        .kerning(2.0)
                                        .fontWeight(.light)
                                        .padding()
                                        .font(.system(.headline))
                                        .foregroundColor(.black)
                                        .multilineTextAlignment(.center)
                                        .scaleEffect(0.9)
                                        .background(Color.white)
                                        .cornerRadius(15)
                                        .opacity(0.7)
                                        .padding(.horizontal, 30.0)
                                        .minimumScaleFactor(0.5)
                                        .frame(width: UIScreen.main.bounds.width-20, alignment: .center)
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
