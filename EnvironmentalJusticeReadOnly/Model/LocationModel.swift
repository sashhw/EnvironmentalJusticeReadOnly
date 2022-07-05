//
//  MapModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/28/21.
//

import Foundation
import MapKit

struct JSONData: Decodable {
    let locations: [Location]
}

struct Location: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let year: String
    
    var image: String
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
