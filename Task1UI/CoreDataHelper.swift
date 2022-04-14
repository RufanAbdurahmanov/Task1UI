//
//  CoreDataHelper.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 13.04.22.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let shared = CoreDataHelper()
    let countryList = DataLoader.shared.countriesList
    var placesList = [[Place]]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func clearContext(entityName: String) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>
        fetchRequest = NSFetchRequest(entityName: entityName)
        
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        deleteRequest.resultType = .resultTypeObjectIDs
        _ = try! context.execute(deleteRequest) as? NSBatchDeleteResult
    }
    
    func insertCountriesData() {
        // CLEAR CONTEXT BEFORE LOADING DATA
        clearContext(entityName: "CountriesEntity")
        
        //let countryList = DataLoader.shared.countriesList
        for country in countryList {
            let countryModel = CountriesEntity(context: context)
            countryModel.id = Int16(country.id)
            countryModel.countryName = country.countryName
            countryModel.population = Int32(country.population)
            countryModel.capitalCity = country.capitalCity
            do {
                try self.context.save()
            } catch {
                print("error")
            }
        }
        
        insertPlacesData()
    }
    
    func fetchCountryList() -> [CountryList]? {
        var countries = [CountryList]()
        //countries.removeAll(keepingCapacity: false)
        do {
            let items = try self.context.fetch(CountriesEntity.fetchRequest())
            //countries.removeAll(keepingCapacity: false)
            for item in items {
                countries.append(CountryList(id: Int(item.id), countryName: item.countryName!, capitalCity: item.capitalCity!, population: Int(item.population), places: nil))
            
            }
            return countries
        } catch {
            print("error: \(error.localizedDescription)")
        }
        return nil
    }
    
    func insertPlacesData() {
        clearContext(entityName: "PlacesEntity")
        for country in countryList {
            for place in country.places ?? [] {
                let placesModel = PlacesEntity(context: context)
                placesModel.countryID = Int16(country.id)
                placesModel.cityID = Int16(place.cityID)
                placesModel.cityName = place.cityName
                placesModel.cityTitle = place.title
                placesModel.cityDescription = place.details.detailsDescription
                placesModel.image = place.image
                do {
                    try self.context.save()
                } catch {
                    print("error")
                }
            }
        }
    }
    
    func fetchPlaces(countryId: Int) -> [Place]? {
        do {
            var places = [Place]()
            let items = try self.context.fetch(PlacesEntity.fetchRequest())
            let placeItems = items.filter({ Int16($0.countryID) == Int16(countryId) })
            
            for item in placeItems {
                places.append(Place(cityID: Int(item.cityID),
                                    title: item.cityTitle ?? "",
                                    cityName: item.cityName ?? "",
                                    image: item.image ?? "",
                                    details: Details(imageName: item.image ?? "", detailsDescription: item.cityDescription ?? "")))
            }
            return places
        } catch {
            print(error)
        }
        
        return nil
    }
}
