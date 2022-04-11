//
//  DetailsViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation


struct DetailsViewModel {
    
    func showDetails (countryID: Int, placesID: Int) -> Detail {
        return ViewController.countries2()[countryID].places[placesID].details
    }
    
    
    
}
