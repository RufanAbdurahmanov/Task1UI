//
//  DetailTableViewCell.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    @IBOutlet weak private var cityImageView: UIImageView!
    @IBOutlet weak private var descLabel: UILabel!
    
    func configure(data: Details) {
        descLabel.text = data.detailsDescription
        cityImageView.image = UIImage(named: data.imageName)
    }
}
