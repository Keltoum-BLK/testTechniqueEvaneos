//
//  DestinationCell.swift
//  DestinationCell
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationCell: UICollectionViewCell {
    //MARK: Variables using to run the elements of the collection Cell
    //Identifier to connection the CollectionView to the collection Cell
    static let identifier = "destinationCell"
// Stars images added to create a rating star
    private var star1 = UIImageView()
    private var star2 = UIImageView()
    private var star3 = UIImageView()
    private var star4 = UIImageView()
    private var star5 = UIImageView()
    
  //MARK: Allocation of the details of each element present in the cell
    var cardView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var filterView: UIView = {
        let veil = UIView()
        veil.backgroundColor = .blue
        veil.translatesAutoresizingMaskIntoConstraints = false
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
        starsField.alignment = .center
        starsField.spacing = 10
        starsField.distribution = .fillProportionally
//        starsField.sizeThatFits(CGSize(width: 250, height: 40))
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
    //Grouping of text elements and rating Stars
    private var card: UIStackView = {
        let cardDestination = UIStackView()
        cardDestination.axis = .vertical
        cardDestination.alignment = .leading
        cardDestination.spacing = 5
        cardDestination.distribution = .fillProportionally
        cardDestination.translatesAutoresizingMaskIntoConstraints = false
        return cardDestination
    }()
    //Init and required init used to code the view without storyboard
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewSetUp()
        layoutSubviews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    //MARK: SetUp the Cell with constraints
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func setUpConstraints() {
        //manage the different elements the VStackView with the tewt and star elements but also the background image
        contentView.addSubview(card)
        card.addArrangedSubview(destinationLabel)
        card.addArrangedSubview(ratingStar)
        card.addArrangedSubview(desc)
        card.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        card.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -67).isActive = true
        card.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 90).isActive = true
        card.bottomAnchor.constraint(equalTo:contentView.bottomAnchor, constant: -20).isActive = true
        
        contentView.addSubview(cardView)
        contentView.sendSubviewToBack(cardView)
        cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    //setUP the cell's shadow
    private func contentViewSetUp() {
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = true
        layer.shadowOpacity = 0.2
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 20)
        //adjust shadow blur
        layer.shadowRadius = 20
    }
    //addind the gradient to the view
    func addGradientLayer(imageView: UIImageView) {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.evaneos(color: .ink).cgColor]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.opacity = 0.25
        gradient.locations = [0,1]
        gradient.frame = imageView.bounds
        imageView.layer.insertSublayer(gradient, at: 0)
    }
    //MARK: SetUp and method for update the rating star for each destination.
    //setup of the stars image
    private func setUpImage(image : UIImageView) {
        image.image = UIImage(systemName: "star.fill")
        image.tintColor = UIColor.evaneos(color: .gold)
        image.sizeThatFits(CGSize(width: 10, height: 10))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = true
    }
    //SetUp and add to the HStackView
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
    //condition to change the star's shape according to the rating
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
}


