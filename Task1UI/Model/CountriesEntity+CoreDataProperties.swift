//
//  CountriesEntity+CoreDataProperties.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 14.04.22.
//
//

import Foundation
import CoreData


extension CountriesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountriesEntity> {
        return NSFetchRequest<CountriesEntity>(entityName: "CountriesEntity")
    }

    @NSManaged public var capitalCity: String?
    @NSManaged public var countryName: String?
    @NSManaged public var id: Int16
    @NSManaged public var population: Int32

}

extension CountriesEntity : Identifiable {

}
