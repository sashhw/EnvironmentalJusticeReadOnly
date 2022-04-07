//
//  DelanoMap.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/7/21.
//

import SwiftUI
import MapKit

struct DelanoMap: View {
    
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.770725, longitude: -119.466926), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 10))
    let delanoLocation = [Location(id: 02, name: "Delano Grape Strike", latitude: 35.770725, longitude: -119.466926, year: "1965", image: "delano")]
    @State var showingAlert = false
    @State var presentingModal = false
    
    var body: some View {
        
        Map(coordinateRegion: $coordinateRegion, interactionModes: MapInteractionModes.zoom, annotationItems: delanoLocation) {
            location in
            MapAnnotation(coordinate: location.coordinate) {
                Button(action: { self.showingAlert = true }) {
                    VStack {
                        Text("🪧")
                            .font(.title)
                            .shadow(color: .black, radius: 3.0)
                        
                    }
                    .sheet(isPresented: $showingAlert) {
                        DelanoSheet(locations: location, presentedAsModal: $presentingModal )
                    }
                    
                }
            }
        }
        .padding()
    }
}
struct DelanoMap_Previews: PreviewProvider {
    static var previews: some View {
        DelanoMap()
    }
}

struct DelanoSheet: View {
    
    @State var locations: Location
    @Binding var presentedAsModal: Bool
    @Environment(\.presentationMode) var presentationMode
    let screenRect = UIScreen.main.bounds
    
    var body: some View {
        ScrollView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: screenRect.width, height: 1300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(5)
                    .shadow(color: .black, radius: 4)
                    .opacity(0.6)
                    .overlay(
                        VStack {
                            Text("What came next...")
                                .kerning(2.0)
                                .fontWeight(.light)
                                .padding()
                                .font(.system(.title2))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .scaleEffect(0.9)
                                .background(Color.white)
                                .cornerRadius(15)
                                .opacity(0.7)
                                .padding(.horizontal, 30.0)
                                .padding(.top, 30.0)
                                .minimumScaleFactor(0.5)
                            Text("Today, the United Farm Workers are still empowering migrant workers to improve their wages and working conditions. Throughout 2021, the UFW has been working on a variety of issues regarding the rights of farm workers. This includes extending healthcare for the workers, which is especially important during the COVID-19 pandemic and wildfires. Also, the group is campaigning towards citizenship for undocumented farm workers, along with banning dangerous pesticide chlorpyrifos.")
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
                            Spacer()
                        }
                    )
            }
        }
    }
}
