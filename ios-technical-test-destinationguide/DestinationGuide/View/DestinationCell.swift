//
//  DestinationCell.swift
//  DestinationCell
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationCell: UICollectionViewCell {
    
    static let identifier = "destinationCell"
    
    var star1 = UIImageView()
    var star2 = UIImageView()
    var star3 = UIImageView()
    var star4 = UIImageView()
    var star5 = UIImageView()
    
    var cardView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var filterView: UIView = {
        let veil = UIView()
        veil.backgroundColor = .yellow
        veil.isOpaque = true
        veil.translatesAutoresizingMaskIntoConstraints = false
        return veil
    }()
    
    private lazy var gradientView: CAGradientLayer = {
        let veil = CAGradientLayer()
        veil.colors = [UIColor.clear, UIColor.black]
        veil.startPoint = CGPoint(x: 1, y: 0)
        veil.endPoint = CGPoint(x: 1, y: 1)
        return veil
    }()
    
    var destinationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .avertaBold(fontSize: 38)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        //        label.backgroundColor = .blue
        return label
    }() // Ne pas oublier de construire ton label
    
    var ratingStar: UIStackView = {
        let starsField = UIStackView()
        starsField.axis = .horizontal
        starsField.alignment = .leading
        starsField.spacing = 5
        starsField.distribution = .fillEqually
        starsField.sizeThatFits(CGSize(width: 150, height: 40))
        starsField.clipsToBounds = true
        starsField.translatesAutoresizingMaskIntoConstraints = false
        //        starsField.backgroundColor = .blue
        return starsField
    }()
    
    var desc: UILabel = {
        let descLabel = UILabel()
        descLabel.textColor = .white
        descLabel.backgroundColor = UIColor.evaneos(color: .ink, alpha: 1)
        descLabel.textAlignment = .center
        descLabel.layer.cornerRadius = 5
        descLabel.font = .avertaBold(fontSize: 16)
        descLabel.numberOfLines = 0
        descLabel.clipsToBounds = true
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        return descLabel
    }()
    
    private var card: UIStackView = {
        let cardDestination = UIStackView()
        cardDestination.axis = .vertical
        cardDestination.alignment = .leading
        cardDestination.spacing = 8
        cardDestination.distribution = .fillProportionally
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
        setUpGradient()
        
        contentView.addSubview(card)
        card.addArrangedSubview(destinationLabel)
        card.addArrangedSubview(ratingStar)
        card.addArrangedSubview(desc)
        card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -67).isActive = true
        card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 110).isActive = true
        card.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -20).isActive = true
    }
    
    private func contentViewSetUp() {
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .clear
        contentView.clipsToBounds = true
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    private func setUpImage(image : UIImageView) {
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = UIColor.evaneos(color: .gold)
        image.sizeThatFits(CGSize(width: 10, height: 10))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = true
    }
    
    private func setupStar() {
        setUpImage(image: star1)
        setUpImage(image: star2)
        setUpImage(image: star3)
        setUpImage(image: star4)
        setUpImage(image: star5)
        ratingStar.addArrangedSubview(star1)
        ratingStar.addArrangedSubview(star2)
        ratingStar.addArrangedSubview(star3)
        ratingStar.addArrangedSubview(star4)
        ratingStar.addArrangedSubview(star5)
    }
    
    func setRating(for star : Int) {
        setupStar()
        switch star {
        case 0:
            star1.image = UIImage(systemName: "star")
            star2.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star5.image = UIImage(systemName: "star")
        case 1:
            star2.image = UIImage(systemName: "star")
            star3.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star5.image = UIImage(systemName: "star")
            
        case 2:
            star3.image = UIImage(systemName: "star")
            star4.image = UIImage(systemName: "star")
            star5.image = UIImage(systemName: "star")
        case 3:
            star4.image = UIImage(systemName: "star")
            star5.image = UIImage(systemName: "star")
        case 4:
            star5.image = UIImage(systemName: "star")
            
        default:
            break
        }
    }
    
    private func setUpGradient() {
        gradientView.frame = filterView.bounds
        filterView.layer.insertSublayer(gradientView, at: 0)
        contentView.addSubview(cardView)
        contentView.sendSubviewToBack(cardView)
        cardView.addSubview(filterView)
        cardView.bringSubviewToFront(filterView)
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}


