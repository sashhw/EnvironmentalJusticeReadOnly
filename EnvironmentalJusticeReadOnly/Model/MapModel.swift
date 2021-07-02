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
    
 struct Location: Decodable, Identifiable {
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
	

//func readFile() {
//     if let url = Bundle.main.url(forResource: "locationsEJCase", withExtension: "json"),
//        let data = try? Data(contentsOf: url) {
//         let decoder = JSONDecoder()
//         if let jsonData = try? decoder.decode(JSONData.self, from: data) {
////             mapView.locations = jsonData.locations
//         }
// }
//
//
//         }

