//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController {
    
    private var collectionView: UICollectionView?
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private let idCell = "idCell"
    var travels = [Destination]()
    var loadData = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        activitySetup()
        recoverData()
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    
    func recoverData() {
        DestinationFetchingService.shared.getDestinations { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let destionations):
                DispatchQueue.main.async {
                    self.travels = Array(destionations)
                    self.activityIndicator.stopAnimating()
                    self.collectionView?.reloadData()
                }
            case .failure(_):
                self.activityIndicator.stopAnimating()
                return
            }
            
        }
    }
    
    func setupCollectionView() {
        activityIndicator.startAnimating()
        setupLayout()
        collectionView?.register(DestinationCell.self, forCellWithReuseIdentifier: DestinationCell.identifier)
        collectionView?.backgroundColor = .white
        view = collectionView
        navigationItem.title = "Destinations"
    }
    
    func setupLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: view.frame.width - 40, height: view.frame.height / 3)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }
    
    func activitySetup() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        collectionView?.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}

extension DestinationController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCell.identifier, for: indexPath) as! DestinationCell
        cell.destinationLabel.text = travels[indexPath.row].name
        cell.desc.text = travels[indexPath.row].tag
        cell.cardView.downloaded(from: travels[indexPath.row].picture)
        cell.setRating(for: travels[indexPath.row].rating)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsController()
        detailsVC.idDestination = travels[indexPath.row].id
        navigationController?.pushViewController(detailsVC, animated: true)
        print(indexPath.row)
    }  
}
