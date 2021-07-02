////
////  MapViewViewModel.swift
////  EnvironmentalJusticeReadOnly
////
////  Created by Sasha on 6/28/21.
////
//
import Foundation

class MapViewVM {
    
var mapViewTwo = MapViewTwo()
    
func readFile() {
    if let url = Bundle.main.url(forResource: "locationsEJCase", withExtension: "json"),
       let data = try? Data(contentsOf: url) {
        let decoder = JSONDecoder()
        if let jsonData = try? decoder.decode(JSONData.self, from: data) {
            mapViewTwo.locations = jsonData.locations
        }
    }
}
}
