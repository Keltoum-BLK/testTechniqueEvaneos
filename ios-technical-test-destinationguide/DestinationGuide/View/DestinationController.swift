//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {

    var collectionView: UICollectionView!
    
    let idCell = "idCell"
    var travels = [Destination]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView?.dataSource = self
        collectionView?.delegate = self
        recoverData(tab: travels)
    
        // Do any additional setup after loading the view.
    }
    
    func recoverData(tab: [Destination])  {
        
        DestinationFetchingService.shared.getDestinations { result in
            switch result {
            case .success(let destionations):
                DispatchQueue.main.async { [self] in
                    self.travels = Array(destionations)
                    collectionView?.reloadData()
                    for place in travels {
                        print(place.name)
                        
                    }
                }
            case .failure(_):
                return
            }
            }
    }
    
    func setupCollectionView() {
        navigationItem.title = "Destinations"
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.register(DestinationCell.self, forCellWithReuseIdentifier: idCell)
        self.view = collectionView
    }
    
//trouver la bonne syntaxe
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationDetails = storyboard?.instantiateViewController(withIdentifier: "destinationsDetails") as! DestinationDetails
//        self.navigationController?.pushViewController(destinationDetails, animated: true)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCell , for: indexPath) as! DestinationCell
        collectionView.addSubview(cell)
        cell.backgroundColor = .black
       return cell
    }
    
  
    }
    
    
    

