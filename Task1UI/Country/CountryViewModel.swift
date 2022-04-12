//
//  CountryViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import UIKit
import Foundation

struct CountryViewModel {
    var countyList = DataLoader.shared.countriesList
    
    func countryCount() -> Int {
        return countyList.count
    }
    
    func cellAtIndexPath(indexPath: Int) -> CountryList {
        return countyList[indexPath]
    }
}
