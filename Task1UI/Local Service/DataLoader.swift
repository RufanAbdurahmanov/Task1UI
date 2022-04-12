//
//  DataLoader.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 12.04.22.
//

import Foundation

class DataLoader {    
    static let shared = DataLoader()

    var countriesList = [CountryList]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let fileLocation = Bundle.main.url(forResource: "Countries", withExtension: "json") {            
            do {
                let data = try Data(contentsOf: fileLocation)
                let decodedData = try JSONDecoder().decode([CountryList].self, from: data)
                self.countriesList = decodedData
            } catch {
                print(error.localizedDescription)
                //debugPrint(error)
            }
        }
    }
}
