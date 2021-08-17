//
//  MapViewOne.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/7/21.
//

import SwiftUI
import MapKit

struct MapViewOne: View {
        @State  var locations: [Location] = []
        @State  var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.179473, longitude: -96.574201), span: MKCoordinateSpan(latitudeDelta: 45, longitudeDelta: 65))
       @State var showingAlert = false
        @State var presentingModal = false
        let screenRect = UIScreen.main.bounds
    
    
    var body: some View {
       Map(coordinateRegion: $coordinateRegion, annotationItems: locations) {
            location in
            MapAnnotation(coordinate: location.coordinate) {
                VStack {
//                    Button(location.year) {
//                        showingAlert = true
//
//                    }
                    Button(action: { self.showingAlert = true }) {
                        VStack {
                            Image(location.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 30)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.white, lineWidth: 25/10))
                                
                            
                                .shadow(radius: 10)
                                .padding()
                           
//                            Text(location.year)
//                                .foregroundColor(.primary)
//                                .font(.callout)
//                                .shadow(radius: 0.5)
                        }
                        .padding()
                    .sheet(isPresented: $showingAlert) {
                        SheetView(locations: location, presentedAsModal: $presentingModal )
                        
                    }
                   
                    }
                    
                    }
                }
            }
    }
}

struct MapViewOne_Previews: PreviewProvider {
    static var previews: some View {
        MapViewOne()
    }
}
