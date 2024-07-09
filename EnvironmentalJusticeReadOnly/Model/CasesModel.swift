//
//  CasesTwo.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 6/11/21.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Case: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String = ""
    var year: Int = 0
    var info: String = ""
    var photo: String = ""
    var userId: String? = ""
    var location: String = ""
}
