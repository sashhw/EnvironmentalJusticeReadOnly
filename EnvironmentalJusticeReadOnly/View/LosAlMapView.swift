//
//  NewMapView.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/3/21.
//

import SwiftUI
import MapKit

struct LosAlMapView: View {
    
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.875556, longitude: -106.324167), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 10))
    let losAlLocation = [Location(id: 01, name: "Los Alamos National Labratory", latitude: 35.875556, longitude: -106.324167, year: "1942", whatCameNext: lostAlSheet, image: "losal1-1")]
    @State var showingAlert = false
    @State var presentingModal = false
    var body: some View {
        
        Map(coordinateRegion: $coordinateRegion, interactionModes: MapInteractionModes.zoom, annotationItems: losAlLocation) {
            location in
            MapAnnotation(coordinate: location.coordinate) {
                Button(action: { self.showingAlert = true }) {
                    VStack {
                        Text("☢️")
                            .font(.title)
                            .shadow(color: .black, radius: 3.0)
                    }
                    .sheet(isPresented: $showingAlert) {
                        LosAlSheet(locations: location, presentedAsModal: $presentingModal )
                    }
                }
            }
        }
        .padding()
    }
}

struct LosAlMapView_Previews: PreviewProvider {
    static var previews: some View {
        LosAlMapView()
    }
}

struct LosAlSheet: View {
    
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
                            
                            Text("In 2002, there was a memorandum of understanding signed between the New Mexico Environment Department and the Pueblo of San Ildefonso. The intent of the memorandum was for both parties to cooperate in monitoring radioactive material and other pollutants present in the Pueblo’s natural resources, which includes the region’s water supply aquifer. In the document, there are various terms about how the data is to be collected and shared.")
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
