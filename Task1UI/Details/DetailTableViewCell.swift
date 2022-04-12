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
    
    var imageName: String! {
        set {
            cityImageView.image = UIImage(named: newValue)
        }
        get {
            return " "
        }
    }
    
    var descText: String! {
        set {
            descLabel.text = newValue
        }
        get {
            return descLabel.text
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
