//
//  countryModel.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import Foundation
import UIKit
//
//struct Country {
//
//    let countryName: String!
//    let capitalCity: String!
//    let populaiton: String!
//
//}
//
////---------------------------------------------------------------------

struct Country2 {
    let countryName: String!
    let capitalCity: String!
    let populaiton: String!
    let places: [Place]!
}

public struct Place {
    let title: String!
    let cityName: String!
    let image: UIImage!
    let details: Detail!
}

struct Detail {
    var imageName: String!
    let description: String!
}
