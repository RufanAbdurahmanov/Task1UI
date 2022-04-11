//
//  PlacesViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class PlacesViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var countryID: Int!
    
//    {
//       didSet {
//           collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
//       }
//   }

    let cellID = "\(PlacesCollectionViewCell.self)"
    
    var detailsID: Int!
    
    var country: Country2?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Places"
        
        collectionView.register(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    
}

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PlacesViewModel().placesCount(indexPath: countryID)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PlacesCollectionViewCell
        
        cell.cityNameLabel.text = CountryViewModel().cellAtIndexPath(indexPath: countryID).places[indexPath.row].cityName
        cell.titleLabel.text = CountryViewModel().cellAtIndexPath(indexPath: countryID).places[indexPath.row].title
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = CountryViewModel().cellAtIndexPath(indexPath: countryID).places[indexPath.row].image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.92, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailsID = indexPath.row
        
        let detailsVC = storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as! DetailsViewController
        
        detailsVC.placeID = indexPath.row
        detailsVC.countryID = countryID
        detailsVC.navigationItem.title = CountryViewModel().cellAtIndexPath(indexPath: countryID).places[indexPath.row].cityName
        navigationController?.show(detailsVC, sender: nil)
        
    }
    
}
