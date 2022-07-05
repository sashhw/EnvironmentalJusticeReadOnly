//
//  CaseLocationSheet.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 6/27/22.
//

import SwiftUI

struct CaseLocationSheet: View {
    var location: Location

    var body: some View {
        Text(location.name)
        Text(location.year)
    }
}

//struct CaseLocationSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseLocationSheet()
//    }
//}
