//
//  DestinationCell.swift
//  DestinationCell
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationCell: UICollectionViewCell {
    
    static let identifier = "destinationCell"
    var tabStar = [UIImageView]()
    let maxOfStar = 5
    
    var starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.contentMode = .scaleAspectFill
        image.sizeToFit()
        image.tintColor = .orange
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var cardView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        imageView.layer.opacity = 12
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var destinationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .avertaBold(fontSize: 38)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.backgroundColor = .blue
        return label
    }() // Ne pas oublier de construire ton label
    
    
    var ratingStar: UIStackView = {
        let starsField = UIStackView()
        starsField.axis = .horizontal
        starsField.alignment = .trailing
        starsField.spacing = 10
        starsField.distribution = .fillEqually
        starsField.alignment = .fill
        starsField.clipsToBounds = true
        starsField.translatesAutoresizingMaskIntoConstraints = false
        starsField.backgroundColor = .blue
        return starsField
    }()
   
    var desc: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .white
        descLabel.backgroundColor = .darkGray
        descLabel.textAlignment = .center
        descLabel.layer.cornerRadius = 5
        descLabel.font = .avertaBold(fontSize: 16)
        descLabel.numberOfLines = 0
        descLabel.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        descLabel.clipsToBounds = true 
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        return descLabel
    }()
    
    var card: UIStackView = {
       let cardDestination = UIStackView()
        cardDestination.axis = .vertical
        cardDestination.alignment = .trailing
        cardDestination.distribution = .fillEqually
        cardDestination.translatesAutoresizingMaskIntoConstraints = false
        return cardDestination
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewSetUp()
        layoutSubviews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func setUpConstraints() {
        contentView.addSubview(destinationLabel)
        destinationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        destinationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50).isActive = true
        destinationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100).isActive = true
        destinationLabel.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -120).isActive = true
        
        contentView.addSubview(desc)
        desc.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        desc.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -220).isActive = true
        desc.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant:  50).isActive = true
        desc.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        
        contentView.addSubview(cardView)
        contentView.sendSubviewToBack(cardView)
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        contentView.addSubview(ratingStar)
        ratingStar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        ratingStar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -150).isActive = true
        ratingStar.topAnchor.constraint(equalTo: destinationLabel.bottomAnchor, constant: 5).isActive = true
        ratingStar.bottomAnchor.constraint(equalTo: desc.topAnchor, constant: -10).isActive = true
        
    }
    
    private func contentViewSetUp() {
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    
    func setRating(for rating : Int) {
        for _ in 0...maxOfStar {
            tabStar.append(starImage)
            ratingStar.addSubview(starImage)
        }
    }
    
    
}
    

