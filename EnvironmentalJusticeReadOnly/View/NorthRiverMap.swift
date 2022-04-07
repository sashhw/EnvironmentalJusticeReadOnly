//
//  NorthRiverMap.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/7/21.
//

import SwiftUI
import MapKit

struct NorthRiverMap: View {
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.825535, longitude: -73.956935), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 10))
    let northRiverLocation = [Location(id: 04, name: "North River Sewage Treatment Plant", latitude: 40.825535, longitude: -73.956935, year: "1985", image: "northriv-1")]
    @State var showingAlert = false
    @State var presentingModal = false
    
    
    
    var body: some View {
        Map(coordinateRegion: $coordinateRegion, interactionModes: MapInteractionModes.zoom, annotationItems: northRiverLocation) {
            location in
            MapAnnotation(coordinate: location.coordinate) {
                Button(action: { self.showingAlert = true }) {
                    VStack {
                        Text("🏭")
                            .font(.title)
                            .shadow(color: .black, radius: 3.0)
                    }
                    .sheet(isPresented: $showingAlert) {
                        NorthRiverSheet(locations: location, presentedAsModal: $presentingModal )
                    }
                }
            }
        }
        .padding()
    }
}

struct NorthRiverMap_Previews: PreviewProvider {
    static var previews: some View {
        NorthRiverMap()
    }
}

struct NorthRiverSheet: View {
    
    @State var locations: Location
    @Binding var presentedAsModal: Bool
    @Environment(\.presentationMode) var presentationMode
    let screenRect = UIScreen.main.bounds
    var body: some View {
        ScrollView(.vertical) {
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
                            
                            Text(northSheet)
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
