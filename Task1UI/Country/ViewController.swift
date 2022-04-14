//
//  ViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit
import JGProgressHUD

 
class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var toolbarHUD: UIToolbar?
    private let viewModel = CountryViewModel.shared
    
    let cellIdentifier = "\(CountryCollectionViewCell.self)"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Countries"        
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        viewModel.getDatas()
        animateProgress()
    }
    func animateProgress() {
        
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        hud.backgroundColor = .black
        hud.layer.opacity = 0.5
        hud.dismiss(afterDelay: 2.5)
    }
}
     


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCountries()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CountryCollectionViewCell
        cell.configureUI(countries: viewModel.itemAtCell(index: indexPath.row)) 
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.92, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let placesVC = storyboard?.instantiateViewController(withIdentifier: "PlacesVC") as! PlacesViewController
        placesVC.countryID = viewModel.itemAtCell(index: indexPath.row).id
        navigationController?.show(placesVC, sender: nil)
    }
}
