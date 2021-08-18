//
//  DetailsController.swift
//  DetailsController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import UIKit
import WebKit

class DetailsController: UIViewController, WKNavigationDelegate {
 
    private var travelDetails = ""
    private var name = ""
    
    var webPage = WKWebView()
    
    var idDestination: String?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        view = webPage
        DetailsLoad()
        webPage.navigationDelegate = self
        webPage.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
        
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webPage.translatesAutoresizingMaskIntoConstraints = false
    }

    private func DetailsLoad() {
        DestinationFetchingService.shared.getDestinationDetails(for: idDestination ?? "") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.travelDetails = details.url.absoluteString
                    self.name = details.name
                    self.navigationItem.title = self.name
                    guard let urlLink = URL(string: self.travelDetails) else { return }
                    self.webPage.load(URLRequest(url: urlLink))
                }
            case .failure(_):
                return
            }
        }
        navigationItem.backBarButtonItem?.title = "Back"
    }
}
