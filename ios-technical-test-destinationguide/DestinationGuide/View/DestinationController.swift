//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController {

    var collectionView: UICollectionView?
    let idCell = "idCell"
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
        navigationItem.title = "Destinations"
        let layout = UICollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = .white
        collectionView?.register(DestinationCell.self, forCellWithReuseIdentifier: "DestinationCell")
        self.view = collectionView
    }
    
  
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.}
    
//trouver la bonne syntaxe
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let destinationDetails = storyboard?.instantiateViewController(withIdentifier: "destinationsDetails") as! DestinationDetails
//        self.navigationController?.pushViewController(destinationDetails, animated: true)
//    }
    
}

extension UIViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 20
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DestinationCell" , for: indexPath) as! DestinationCell
////        guard let destinations = travels else { return cell }
//        cell.destinationLabel.text = destinations[indexPath.item].name
//        cell.desc.text = destinations[indexPath.item].name
       return cell
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 280)
    }
 
    }
    
    
    

