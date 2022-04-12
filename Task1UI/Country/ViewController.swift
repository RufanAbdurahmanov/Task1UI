//
//  ViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let viewModel = CountryViewModel()
    
    let cellIdentifier = "\(CountryCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Countries"        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.countryCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CountryCollectionViewCell
        cell.configureUI(countries: viewModel.cellAtIndexPath(indexPath: indexPath.row))        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.92, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let placesVC = storyboard?.instantiateViewController(withIdentifier: "PlacesVC") as! PlacesViewController
        placesVC.viewModel.country = viewModel.cellAtIndexPath(indexPath: indexPath.row)
        navigationController?.show(placesVC, sender: nil)
    }
}
