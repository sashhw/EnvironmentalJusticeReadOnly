//
//  CasesTwo.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Case: Identifiable, Codable
{
  @DocumentID var id: String?
    var name: String = ""
    var year: Int = 0
    var info: String = ""
    var photo: String = ""
    var userId: String? = ""
    var location: String = ""
    
   
//    var coordinate: CLLocationCoordinate2D
//    var latitude: Double
//    var longitude: Double
    
//     init?(documentID: String, dictionary: [String: Any]) {
//           guard let name = dictionary["name"] as? String,
//              let year =  dictionary["year"] as? Int,
//              let info =  dictionary["info"] as? String,
//              let photo = dictionary["photo"] as? String,
//              let location =  dictionary["location"] as? String,
//
//
//
//              let geoPoint = dictionary["location"] as? GeoPoint else { return nil }
//              let latitude = geoPoint.latitude
//              let longitude = geoPoint.longitude
//
//        let caseLocation =  CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//
//
//    }


}
