//
//  PlacesViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation

class PlacesViewModel {
    var itemList = [Place]()
    var country: CountryList?
    
    func getPlaces(countryID: Int) {
        itemList = CoreDataHelper.shared.fetchPlaces(countryId: countryID)!
    }
    
    func placesCount() -> Int {
        itemList.count
    }
    
    func placeAtSelectedItem(index: Int) -> Place? {
        itemList[index]
    }
}
