//
//  PlacesViewController.swift
//  Task1UI
//
//  Created by Rufan Abdurahmanov on 08.04.22.
//

import UIKit

class PlacesViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    
    let cellID = "\(PlacesCollectionViewCell.self)"
    
    var id: Int!
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
        country?.places.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PlacesCollectionViewCell
        cell.backgroundColor = .gray
        cell.cityNameLabel.text = country?.places[indexPath.row].cityName
        cell.titleLabel.text = country?.places[indexPath.row].title
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.image = country?.places[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.92, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailsID = indexPath.row
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let detailsVC = segue.destination as! DetailsViewController
            if let place = country?.places[detailsID] {
                detailsVC.place = place
            }
        }
    }
}
