//
//  MapWithCaseLocations.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/28/22.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var showAnnotation = false
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 35.0,
            longitude: -96.0),
        span: MKCoordinateSpan(
            latitudeDelta: 30,
            longitudeDelta: 65
        )
    )
    @State var locations = locationsArray
    @State var selectedLocation: Location?

    let screenRect = UIScreen.main.bounds

    var body: some View {
        ZStack {
            Image("dam-edited")
                .opacity(0.3)
                .backgroundImageStyle()
            VStack {
                Text("EcoJustice Cases on Map")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .kerning(0.5)
                    .padding(.bottom, 100)

                Map(coordinateRegion: $region, annotationItems: locations) { location in
                    MapAnnotation(
                        coordinate: CLLocationCoordinate2D(
                            latitude: location.latitude,
                            longitude: location.longitude
                        )
                    ) {
                        Button {
                            selectedLocation = location
                        } label: {
                            Text(location.image)
                                .font(.title)
                        }
                        .sheet(item: $selectedLocation) { location in
                            MapLocationModal(location: location)
                        }
                    }
                }
                .frame(width: screenRect.width - 20, height: 300, alignment: .center)
                .cornerRadius(5)
                Spacer()
            }

        }
    }
}

struct MapWithCaseLocations_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
