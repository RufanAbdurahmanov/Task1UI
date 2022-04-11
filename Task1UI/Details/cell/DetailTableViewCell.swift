//
//  DetailTableViewCell.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 11.04.22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
