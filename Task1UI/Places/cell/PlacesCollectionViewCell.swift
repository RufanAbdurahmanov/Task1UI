//
//  PlacesCollectionViewCell.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var cityNameLabel: UILabel!
    
    
    func configure(place: Place) {
        
        imageView.image = UIImage(named: place.image)
        titleLabel.text = place.title
        cityNameLabel.text = place.cityName
        
        
    }
    
    
    

}
