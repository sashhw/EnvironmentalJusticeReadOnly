//
//  ContentView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import SwiftUI

struct ContentView: View {
   
    @State var flipped = false
   
    let mapView = MapViewTwo()
    let usCases = USCases()
    @State var showSignInForm = false
    @State var showSheetView = false
    let screenRect = UIScreen.main.bounds
    
    var body: some View {
        HStack {
            NavigationView {
                VStack(alignment: .center) {
                    ZStack {
                        VStack {
                            ZStack {
        
        Image("spainEnv")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: screenRect.width, height: 1500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(5)
            .shadow(color: .black, radius: 4)
            .opacity(0.6)
        
            .overlay(
                Group {
                    Spacer()
                
                ejTitle()
      
           
            if !self.flipped {
           Spacer(minLength: 10)
            
            
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
        else {
            
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
            
    }
                    
            NavigationLink(destination: usCases) {
                
                Text("U.S. Cases")
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
                    
                  
            NavigationLink(destination: mapView) {
                Text("Map View")
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
            .padding(.bottom, 50)
            .navigationBarItems(trailing:
                            Button(action: {
                                self.showSheetView.toggle()
                            }) {
                                Image(systemName: "info.circle")
                                    .font(Font.system(.title2))
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            }
                        )
                  
          Spacer()
    }
                .rotation3DEffect(self.flipped ? Angle(degrees: 0): Angle(degrees: 0), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                .animation(.default)
                .onTapGesture {
                self.flipped.toggle()
               
                
                }
                ,
           alignment: .center
) }
}
}
                }
                .sheet(isPresented: $showSignInForm) {
//                    SignInView()
                }
                .sheet(isPresented: $showSheetView) {
                           CiteSheetView()
                            }
            
        
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
