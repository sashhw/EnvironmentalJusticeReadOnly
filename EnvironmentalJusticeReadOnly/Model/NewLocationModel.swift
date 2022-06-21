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
    let image: String

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

let locationsArray = [
    Location(id: 0, name: "Los Alamos National Laboratory", latitude: 35.875556, longitude: -106.324167, year: "1942", image: "☢️"),
    Location(id: 1, name: "Delano Grape Strike", latitude: 35.770725, longitude: -119.466926, year: "1965", image: "🪧"),
    Location(id: 2, name: "Hawkins v. Town of Shaw", latitude: 33.601685, longitude: -90.772131, year: "1971", image: "🏚"),
    Location(id: 3, name: "Warren County PCB Landfill", latitude: 36.3523, longitude: -78.1582, year: "1982", image: "☢️"),
    Location(id: 4, name: "North River Sewage Treatment Plant", latitude: 40.825535, longitude: -73.956935, year: "1985", image: "🏭")

]
