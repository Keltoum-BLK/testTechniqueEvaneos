//
//  DestinationCell.swift
//  DestinationCell
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationCell: UICollectionViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var cardView: UIImageView!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var ratingStar: UITabBar!
    @IBOutlet weak var desc: UILabel!
    
    var country: Destination! {
        didSet {
            contentView.clipsToBounds = true
            contentView.layer.cornerRadius = 10
            destinationLabel.text = country.name
            cardView.load(url: country.picture)
            desc.text = country.tag
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
        
    
    func setupNameLabel() {
        destinationLabel.font = .avertaBold(fontSize: 38)
        destinationLabel.textColor = .white
        destinationLabel.topAnchor.constraint(equalTo: cardView.topAnchor).isActive = true
        destinationLabel.layoutMargins.left = 8
        clipsToBounds = true
        view.addSubview(destinationLabel)
    }
    
    
    func setupDesc() {
        desc.textColor = .white
        desc.font = .avertaBold(fontSize: 16)
        desc.layoutMargins.left = 8
        desc.backgroundColor = .darkGray
        clipsToBounds = true
        view.addSubview(desc)
    }
    
    func setupCardView() {
        cardView.layer.cornerRadius = 10
        clipsToBounds = true
        cardView.layer.shadowColor = .init(gray: 100, alpha: 20)
        view.addSubview(cardView)
        
    }
    
    func setupRatingStar() {
        
    }
    
    
    func setupViews() {
    setupNameLabel()
    setupDesc()
    setupCardView()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
 
    
    
}
