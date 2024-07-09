//
//  CasesTwo.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation
import SwiftData


@available(iOS 17, *)
@Model
class Event {
    var name: String
    var year: Int
    var info: String
    var photo: String
    var location: String
    
    init(name: String, year: Int, info: String, photo: String, location: String) {
        self.name = name
        self.year = year
        self.info = info
        self.photo = photo
        self.location = location
    }
}
