//
//  DetailsController.swift
//  DetailsController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import UIKit
import WebKit

class DetailsController: UIViewController, WKNavigationDelegate {
    
    let identifier = "WebPage"
    
    var webPage:  WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    var idDestination: String?
    var travelDetails = [DestinationDetails]()
    
    override func loadView() {
       
        view = webPage
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        webPage.navigationDelegate = self
        view.addSubview(webPage)
        navigationController?.title = "Pays"
      
        // Do any additional setup after loading the view.
//        DestinationFetchingService.shared.getDestinationDetails(for: idDestination ?? "") { result in
//            switch result {
//            case .success(let details):
//                DispatchQueue.main.async {
//                    self.travelDetails = Array(arrayLiteral: details)
//                    var urlLink = URL(string: (travelDetails[index].url))
//                    self.webPage.load(URLRequest(url: urlLink))
//                    self.webPage.allowsBackForwardNavigationGestures = true
//                }
//            case .failure(_):
//                return
//            }
//        }
        //déclarer l'URL ici
        guard let urlLink = URL(string: "https://lifeisstrange.square-enix-games.com/en-us/games/life-is-strange-true-colors/") else { return }
        webPage.load(URLRequest(url: urlLink))
       
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        webPage.translatesAutoresizingMaskIntoConstraints = false
    }

  
}
