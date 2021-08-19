//
//  DestinationController.swift
//  DestinationController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationController: UIViewController {
//MARK: Variables using to run the collectionView
    //variables useful for the use of the collectionView and the retrieval of the data.
    private var collectionView: UICollectionView?
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private let idCell = "idCell"
    private var travels = [Destination]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        activitySetup()
        recoverData()
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
    //network call for Data recovery
    func recoverData() {
        DestinationFetchingService.shared.getDestinations { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let destinations):
                self.updateData(with: Array(destinations))
            case .failure(_):
                self.activityIndicator.stopAnimating()
                return
            }
            
        }
    }
    //assign the Set to an array, stop view load animation and retrieval with updating data in the CollectionView
    func updateData(with destination: [Destination]) {
        DispatchQueue.main.async {
            self.travels = Array(destination)
            self.activityIndicator.stopAnimating()
            self.collectionView?.reloadData()
        }
    }
    //MARK: Methods to setUP the view and the activity indicator.
    //register,set the colletionView to the the view, call load animation and setUpLayout method
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
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
//MARK: Extension to configure the view with the cell and data and also push to a DetailsController
extension DestinationController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCell.identifier, for: indexPath) as! DestinationCell
        cell.destinationLabel.text = travels[indexPath.row].name
        cell.desc.text = travels[indexPath.row].tag?.lowercased()
        cell.cardView.downloaded(from: travels[indexPath.row].picture)
        cell.addGradientLayer(imageView: cell.cardView)
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
