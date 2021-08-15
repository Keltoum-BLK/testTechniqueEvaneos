//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController {

    var collectionView: UICollectionView?
    let destionationIdentifier = "destionationIdentifier"
    var travels: [Destination]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView?.dataSource = self
        collectionView?.delegate = self
        DestinationFetchingService.shared.getDestinations { result in
            switch result {
            case .success(let destionations):
                DispatchQueue.main.async { [self] in
                    self.travels = Array(destionations)
                    collectionView?.reloadData()
                    for place in travels! {
                        print(place.name)
                    }
                }
            case .failure(_):
                return
            }
            }
        // Do any additional setup after loading the view.
    }
    
    func setupCollectionView() {
        
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(DestinationCell.self, forCellWithReuseIdentifier: "destionationCell")
        
        collectionView?.backgroundColor = .white
        self.view = collectionView
    }
    
  
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.}
    
    
    
}

extension UIViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "destionationIdentifier", for: indexPath) as! DestinationCell
        guard let travel = travels else { return cell }
        cell.destinationLabel.text = travel[indexPath.item].name
       return cell
    }
    
 
    }
    
    
    

