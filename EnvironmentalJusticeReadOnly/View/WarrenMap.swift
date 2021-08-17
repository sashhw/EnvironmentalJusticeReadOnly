//
//  WarrenMap.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 8/7/21.
//

import SwiftUI
import MapKit

struct WarrenMap: View {
    
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.3523, longitude: -78.1582), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 10))
    let warrenLocation = [Location(id: 04, name: "Warren County PCB Landfil", latitude: 36.3523, longitude: -78.1582, year: "1982", image: "WarrenCO")]
    @State var showingAlert = false
    @State var presentingModal = false
    
    var body: some View {
        
          Map(coordinateRegion: $coordinateRegion, interactionModes: MapInteractionModes.zoom, annotationItems: warrenLocation) {
              location in
              MapAnnotation(coordinate: location.coordinate) {
                Button(action: { self.showingAlert = true }) {
                VStack {
                  Text("☢️")
                    .font(.title)
                    .shadow(color: .black, radius: 3.0)
                    
                  

          }
                .sheet(isPresented: $showingAlert) {
             WarrenSheet(locations: location, presentedAsModal: $presentingModal )
        }
              
      }
    }
}
          .padding()
    }
}
struct WarrenMap_Previews: PreviewProvider {
    static var previews: some View {
        WarrenMap()
    }
}
struct WarrenSheet: View {
  
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
            Text(warrenSheet)
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
