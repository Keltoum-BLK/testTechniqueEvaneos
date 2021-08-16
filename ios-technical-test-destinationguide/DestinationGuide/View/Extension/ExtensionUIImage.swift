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
            DispatchQueue.main.async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }


func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
    contentMode = mode
    URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
        guard
            let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
            let mimeType = response?.mimeType, mimeType.hasPrefix(""),
            let data = data, error == nil,
            let image = UIImage(data: data)
        else { return }
        DispatchQueue.main.async() {
            self?.image = image
        }
    }.resume()
}

func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
    guard let url = URL(string: link) else { return }
    downloaded(from: url, contentMode: mode)
}
}


//func downloadAvatar(destination: Destination) {
//
//    let imageUrl = destination.picture
//    guard let url = URL(string: imageUrl.absoluteString) else {
//         return
//     }
//
//     let task = URLSession.shared.dataTask(with: url) { data, response, error in
//         DispatchQueue.main.async {
//
//         }
//         guard let data = data, error == nil else {
//             return
//         }
//
//         let imageData = try? Data(contentsOf: imageUrl)
//         guard let dataImage = imageData else { return }
//         var dataM = dataImage
//         dataM = data
//     }
//
//     task.resume()
// }
//}
//
//
//
//
//
//
//
//
