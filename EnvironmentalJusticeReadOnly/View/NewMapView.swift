//
//  MapWithCaseLocations.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 4/28/22.
//

import SwiftUI
import MapKit

struct NewMapView: View {

    @ObservedObject var datas = ReadData()
    
    var body: some View {
       
    }
}

struct MapWithCaseLocations_Previews: PreviewProvider {
    static var previews: some View {
        NewMapView()
    }
}
