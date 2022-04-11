//
//  PlacesViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation


struct PlacesViewModel {
    
    
    func placesCount(indexPath: Int) -> Int {
        return ViewController.countries2()[indexPath].places.count
    }
    
    func placeAtSelectedItem(indexPath: Int, id: Int) -> Place {
        
        return ViewController.countries2()[indexPath].places[id]

    }
    
    
    
    
    
}
