//
//  DetailsViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 09.04.22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textView: UITextView!
    
    var place: Place?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let place = place {
            setupData(place: place)
        }
    }
    
    func setupData(place: Place) {
       navigationItem.title = place.cityName
       textView.text = place.details.description
       imageView.image = UIImage(named: place.details.imageName)
   }
}
