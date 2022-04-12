//
//  DetailsViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 09.04.22.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel = DetailsViewModel()
    let tableCellID = "\(DetailTableViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.place?.cityName
        
        tableView.register(UINib(nibName: tableCellID, bundle: nil), forCellReuseIdentifier: tableCellID)
    }
}


extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellID, for: indexPath) as! DetailTableViewCell
        if let detail = viewModel.showDetails() {
            cell.descText = detail.description
            cell.imageName = detail.imageName
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
