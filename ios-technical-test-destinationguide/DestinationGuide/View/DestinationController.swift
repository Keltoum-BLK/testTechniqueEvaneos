//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView?
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private let idCell = "idCell"
    var travels = [Destination]()
    var loadData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        recoverData()
        // Do any additional setup after loading the view.
    }
    
    func recoverData() {
        //        activitySetup()
        //        loadData = false
        DestinationFetchingService.shared.getDestinations { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let destionations):
                DispatchQueue.main.async {
                    self.travels = Array(destionations)
                    self.collectionView?.reloadData()
                    }
            case .failure(_):
                return
                }
           
            }
        }
    
    func setupCollectionView() {
        let view = UIView()
        view.backgroundColor = .white
        setupLayout()
        collectionView?.register(DestinationCell.self, forCellWithReuseIdentifier: DestinationCell.identifier)
        collectionView?.backgroundColor = .white
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
        self.view = collectionView
        navigationItem.title = "Destinations"
        
    }
    
    func setupLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: self.view.frame.width - 40, height: view.frame.height - 580)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    }
    
    func activitySetup() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        //        if !loadData {
        //            activityIndicator.stopAnimating()
        //        } else {
        //            activityIndicator.startAnimating()
        //        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCell.identifier , for: indexPath) as! DestinationCell
        cell.destinationLabel.text = travels[indexPath.row].name
        cell.desc.text = travels[indexPath.row].tag?.lowercased()
        cell.cardView.d
        cell.ratingStar.tag = travels[indexPath.row].rating
        return cell
    }
    
    
}




