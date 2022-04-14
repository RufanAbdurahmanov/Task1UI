//
//  countryModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import Foundation
import UIKit

struct CountryList: Codable {
    let id: Int
    var countryName, capitalCity: String
    var population: Int
    let places: [Place]?
}

// MARK: - Place
struct Place: Codable {
    let cityID: Int
    let title, cityName, image: String
    let details: Details
}

// MARK: - Details
struct Details: Codable {
    let imageName, detailsDescription: String

    enum CodingKeys: String, CodingKey {
        case imageName
        case detailsDescription = "description"
    }
}





