//
//  PlacesViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation

struct PlacesViewModel {
    var country: CountryList?
    
    func placesCount() -> Int {
        return country?.places.count ?? 0
    }
    
    func placeAtSelectedItem(index: Int) -> Place? {
        return country?.places[index]
    }
}
