//
//  CountryViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import UIKit
import Foundation

class CountryViewModel {
    static let shared = CountryViewModel()
    var dataItems = [CountryList]()
    
    func getDatas() {
        CoreDataHelper.shared.insertCountriesData()
        dataItems = CoreDataHelper.shared.fetchCountryList() ?? []
    }
    
    func numberOfCountries() -> Int {
        return dataItems.count
    }
    
    func itemAtCell(index: Int) -> CountryList {
        return dataItems[index]
    }
}
