//
//  MapViewThree.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/3/21.
//

import SwiftUI

struct MainMapView: View {
    @State  var locations: [Location] = []
    
    let locationOne = Location(id: 0, name: "Los Alamos National Laboratory", latitude: 35.875556, longitude: -106.324167, year: "1942", image: "losal1-1")
    let locationTwo = Location(id: 1, name: "Delano Grape Strike", latitude: 35.770725, longitude: -119.466926, year: "1965", image: "delano")
    let locationThree = Location(id: 2, name: "Hawkins v. Town of Shaw", latitude: 33.601685, longitude: -90.772131, year: "1971", image: "hawkinsshaw")
    let locationFour = Location(id: 3, name: "Warren County PCB Landfill", latitude: 36.3523, longitude: -78.1582, year: "1982", image: "WarrenCO")
    let locationFive = Location(id: 4, name: "North River Sewage Treatment Plant", latitude: 40.825535, longitude: -73.956935, year: "1985", image: "northriv-1")
    
    @State var zoomed = false
    let screenRect = UIScreen.main.bounds
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            ZStack {
                Image("dam")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 1850, height: 1500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 4)
                    .opacity(0.1)
                    .overlay(
                        HStack(alignment: .center, spacing: 10) {
                            ScrollView {
                                Spacer(minLength: 350)
                                VStack(alignment: .center) {
                                    Group  {
                                        Text(locationOne.name)
                                            .font(.title3)
                                            .multilineTextAlignment(.center)
                                            .padding()
                                            .padding(.top, 30.0)
                                        Text("Los Alamos, New Mexico")
                                            .italic()
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                    NewMapView()
                                        .frame(width: 350, height: 300, alignment: .center)
                                    
                                    Image("losal1-1")
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 7)
                                        .frame(width: 250, height: 250, alignment: .center)
                                        .aspectRatio(contentMode: .fill)
                                        .padding(.bottom, -130)
                                        .scaleEffect(self.zoomed ? 1.0 : 0.8)
                                        .onTapGesture {
                                            self.zoomed.toggle()
                                        }
                                        .animation(.easeInOut(duration: 0.5))
                                    
                                    Spacer()
                                }
                                Spacer()
                            }
                            
                            Divider()
                            
                            ScrollView {
                                Spacer(minLength: 350)
                                VStack(alignment: .center) {
                                    Group {
                                        Text(locationTwo.name)
                                            .padding()
                                            .font(.title3)
                                            .padding(.top, 30.0)
                                        Text("Delano, California")
                                            .italic()
                                            .multilineTextAlignment(.center)
                                    }
                                    
                                    DelanoMap()
                                        .frame(width: 350, height: 300, alignment: .center)
                                    
                                    Image("delano")
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 7)
                                        .frame(width: 350, height: 250, alignment: .center)
                                        .aspectRatio(contentMode: .fill)
                                        .padding(.bottom, -130)
                                        .scaleEffect(self.zoomed ? 1.0 : 0.8)
                                        .onTapGesture {
                                            self.zoomed.toggle()
                                        }
                                        .animation(.easeInOut(duration: 0.5))
                                    
                                    Spacer()
                                }
                                
                                Spacer()
                                
                            }
                            Divider()
                            
                            ScrollView {
                                Spacer(minLength: 350)
                                Group {
                                    VStack(alignment: .center) {
                                        Group {
                                            Text(locationThree.name)
                                                .padding()
                                                .font(.title3)
                                                .padding(.top, 30.0)
                                            Text("Shaw, Mississippi")
                                                .italic()
                                                .multilineTextAlignment(.center)
                                        }
                                        
                                        HawkinsMap()
                                            .frame(width: 350, height: 300, alignment: .center)
                                        
                                        Image("hawkinsshaw")
                                            .resizable()
                                            .frame(width: 350, height: 250, alignment: .center)
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                            .shadow(radius: 7)
                                            .frame(width: 250, height: 250, alignment: .center)
                                            .aspectRatio(contentMode: .fill)
                                            .padding(.bottom, -130)
                                            .scaleEffect(self.zoomed ? 1.0 : 0.8)
                                            .onTapGesture {
                                                self.zoomed.toggle()
                                            }
                                            .animation(.easeInOut(duration: 0.5))
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                            Divider()
                            
                            ScrollView {
                                Spacer(minLength: 350)
                                VStack(alignment: .center) {
                                    Group {
                                        Text(locationFour.name)
                                            .padding()
                                            .font(.title3)
                                            .padding(.top, 30.0)
                                        Text("Warren County, North Carolina")
                                            .italic()
                                            .multilineTextAlignment(.center)
                                    }
                                    WarrenMap()
                                        .frame(width: 350, height: 300, alignment: .center)
                                    
                                    Image("WarrenCO")
                                        .resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 7)
                                        .frame(width: 250, height: 250, alignment: .center)
                                        .aspectRatio(contentMode: .fill)
                                        .padding(.bottom, -130)
                                        .scaleEffect(self.zoomed ? 1.0 : 0.8)
                                        .onTapGesture {
                                            self.zoomed.toggle()
                                        }
                                        .animation(.easeInOut(duration: 0.5))
                                    
                                    Spacer()
                                }
                                Spacer()
                            }
                            Divider()
                            
                            ScrollView {
                                Spacer(minLength: 350)
                                Group {
                                    VStack(alignment: .center) {
                                        Group {
                                            Text(locationFive.name)
                                                .padding()
                                                .font(.title3)
                                                .padding(.top, 30.0)
                                            Text("New York, New York")
                                                .italic()
                                                .multilineTextAlignment(.center)
                                        }
                                        NorthRiverMap()
                                            .frame(width: 350, height: 300, alignment: .center)
                                        
                                        Image("northriv-1")
                                            .resizable()
                                            .clipShape(Circle())
                                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                            .shadow(radius: 7)
                                            .frame(width: 250, height: 250, alignment: .center)
                                            .aspectRatio(contentMode: .fill)
                                            .padding(.bottom, -130)
                                            .scaleEffect(self.zoomed ? 1.0 : 0.8)
                                            .onTapGesture {
                                                self.zoomed.toggle()
                                            }
                                            .animation(.easeInOut(duration: 0.5))
                                        
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            }
                        }
                    )
                    .ignoresSafeArea()
            }
        }
    }
}



