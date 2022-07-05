//
//  MapWithCaseLocations.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/28/22.
//

import SwiftUI
import MapKit

struct NewMapView: View {
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
    let screenRect = UIScreen.main.bounds

    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations) { location in
            MapAnnotation(
                coordinate: CLLocationCoordinate2D(
                    latitude: location.latitude,
                    longitude: location.longitude
                )
            ) {
                NavigationLink {
                    CaseLocationSheet(location: location)

                } label: {
                    Text(location.image)
                }
            }
        }
        .frame(width: screenRect.width - 20, height: 300, alignment: .center)
    }
}

struct MapWithCaseLocations_Previews: PreviewProvider {
    static var previews: some View {
        NewMapView()
    }
}
