//
//  CountryViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation

struct CountryViewModel {
    
    let countryList: [Country2] = ViewController.countries2()
    
    
    func countryCount() -> Int {
        return countryList.count
    }
    
    func cellAtIndexPath(indexPath: Int) -> Country2 {
        return countryList[indexPath]
    }
    
    
    
    
    
    
}

