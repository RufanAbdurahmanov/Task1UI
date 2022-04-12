//
//  DetailsViewModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import Foundation


struct DetailsViewModel {
    var place: Place?
    
    func showDetails() -> Details? {
        return place?.details
    }
}
