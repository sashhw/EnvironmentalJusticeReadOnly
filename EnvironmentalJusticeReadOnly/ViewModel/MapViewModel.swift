//
//  MapViewModel.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha Walkowski on 6/21/22.
//

import Foundation

class ReadData: ObservableObject {
    @Published var locations = [NewLocation]()

    init() {
        loadData()
    }

    func loadData() {
        guard let url = Bundle.main.url(forResource: "locationsEJCase", withExtension: "json")
        else {
            print("JSON not found")
            return
        }

        let data = try? Data(contentsOf: url)
        let locations = try? JSONDecoder().decode([NewLocation].self, from: data!)
        self.locations = locations!
    }
}
