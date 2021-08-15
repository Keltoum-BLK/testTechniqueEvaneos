//
//  ExtensionUIImage.swift
//  ExtensionUIImage
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import Foundation
import UIKit

extension UIImageView {
    
    
    func load(url: URL) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    
}
    
    
    
    
    
    
    
    

