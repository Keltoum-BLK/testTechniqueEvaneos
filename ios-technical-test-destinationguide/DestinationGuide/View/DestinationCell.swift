//
//  DestinationCell.swift
//  DestinationCell
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit

class DestinationCell: UICollectionViewCell {
    
    static let identifier = "destinationCell"


     var cardView: UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "star.fill")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .blue
        imageView.clipsToBounds = true
        return imageView
    }
    var destinationLabel: UILabel {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .gray
        label.clipsToBounds = true
        return label
    }
    var ratingStar = UIStackView()
    var desc = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutSubviews()
        contentViewSetUp()
        contentView.addSubview(cardView)
        contentView.addSubview(destinationLabel)
       
    }
        
    private func contentViewSetUp() {
        contentView.layer.cornerRadius = 20
        contentView.backgroundColor = .gray
        contentView.clipsToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
   
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    
 
    
    
}
