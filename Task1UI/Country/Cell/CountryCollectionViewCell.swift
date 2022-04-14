//
//  CountryCollectionViewCell.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {    
    @IBOutlet weak private var countryName: UILabel!
    @IBOutlet weak private var capitalCity: UILabel!
    @IBOutlet weak private var population: UILabel!
    
    
    func configureUI(countries: CountryList) {
        countryName.text = countries.countryName
        capitalCity.text = countries.capitalCity
        population.text = "\(countries.population)"
    }
   

}
