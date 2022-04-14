//
//  PlacesViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class PlacesViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel = PlacesViewModel()
    let cellID = "\(PlacesCollectionViewCell.self)"
    var countryID: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Places"
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
        viewModel.getPlaces(countryID: countryID)
    }
}

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.placesCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PlacesCollectionViewCell
        cell.configure(place: viewModel.placeAtSelectedItem(index: indexPath.row)!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.92, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        detailsVC.viewModel.place = viewModel.placeAtSelectedItem(index: indexPath.row)
        navigationController?.show(detailsVC, sender: nil)
    }
}
