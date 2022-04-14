//
//  PlacesEntity+CoreDataProperties.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 14.04.22.
//
//

import Foundation
import CoreData


extension PlacesEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlacesEntity> {
        return NSFetchRequest<PlacesEntity>(entityName: "PlacesEntity")
    }

    @NSManaged public var cityDescription: String?
    @NSManaged public var cityName: String?
    @NSManaged public var countryID: Int16
    @NSManaged public var cityID: Int16
    @NSManaged public var image: String?
    @NSManaged public var cityTitle: String?

}

extension PlacesEntity : Identifiable {

}
