//
//  DetailsController.swift
//  DetailsController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import UIKit
import WebKit

class DetailsController: UINavigationController, WKNavigationDelegate {
    
    let identifier = "WebPage"
    
    var webPage: WKWebView = {
        let web = WKWebView()
        web.backgroundColor = .white
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()
    
    var idDestination: String?
    var travelDetails: [DestinationDetails]?
    
    override func loadView() {
        webPage.navigationDelegate = self
        view = webPage
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setWeb()
       
      
        // Do any additional setup after loading the view.
        DestinationFetchingService.shared.getDestinationDetails(for: idDestination ?? "") { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.travelDetails = Array(arrayLiteral: details)
                }
            case .failure(_):
                return
            }
        }
        //déclarer l'URL ici
//        let url = URL(string: travelDetails[index].url)!
//        webPage.load(URLRequest(url: url))
        webPage.allowsBackForwardNavigationGestures = true
    }

    
    func setWeb() {
        view.addSubview(webPage)
        webPage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        webPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        webPage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        webPage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
