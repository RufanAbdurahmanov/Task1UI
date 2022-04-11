//
//  DetailsViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 09.04.22.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let tableCellID = "\(DetailTableViewCell.self)"
    
    @IBOutlet weak var tableView: UITableView!
    
    var countryID = PlacesViewController().countryID
    var placeID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: tableCellID, bundle: nil), forCellReuseIdentifier: tableCellID)
        tableView.rowHeight = 900
    }
    
    }
    

    func setupData() {
//        textView.text = DetailsViewModel().showDetails(countryID: countryID!, placesID: placeID).description
//        imageView.image = UIImage(named: DetailsViewModel().showDetails(countryID: countryID!, placesID: placeID).imageName)
   }


extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! DetailTableViewCell
        cell.cityImageView.image = UIImage(named: DetailsViewModel().showDetails(countryID: countryID!, placesID: placeID).imageName!)
        cell.textView.text = DetailsViewModel().showDetails(countryID: countryID!, placesID: placeID).description
        //cell.backgroundColor = .blue
        return cell
    }
    
    
}
