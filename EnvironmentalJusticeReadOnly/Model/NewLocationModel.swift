//
//  NewMapModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 6/21/22.
//

import Foundation
import CoreLocation

struct NewJSONData: Decodable {
    let locations: [NewLocation]
}

struct NewLocation: Decodable, Identifiable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
    let year: String

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
