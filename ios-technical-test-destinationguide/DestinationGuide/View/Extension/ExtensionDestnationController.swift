//
//  ExtensionDestnationController.swift
//  ExtensionDestnationController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import Foundation
import UIKit

extension DestinationController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travels.count
    }
    // the idDestination to another view to reuse it to recover webpage and destination's name for title
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCell.identifier , for: indexPath) as? DestinationCell else { return UICollectionViewCell() }
        cell.destinationLabel.text = travels[indexPath.row].name
        cell.desc.text = travels[indexPath.row].tag?.lowercased()
        cell.setRating(for: travels[indexPath.row].rating)
        cell.cardView.downloaded(from: travels[indexPath.row].picture)
        return cell
    }
 
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
       
        let idDestination = travels[indexPath.row].id
        performSegue(withIdentifier: "WebPage", sender: idDestination)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "WebPage" {
            guard let detailVC = segue.destination as? DetailsController else {return}
            detailVC.idDestination = sender as? String
            self.navigationController?.pushViewController(detailVC, animated: true)
            }
    }
}
