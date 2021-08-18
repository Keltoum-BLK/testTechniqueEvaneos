//
//  DetailsController.swift
//  DetailsController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import UIKit
import WebKit

class DetailsController: UIViewController, WKNavigationDelegate {
 
    private var webPage = WKWebView()
    var idDestination: String?
    
    override func loadView() {
        view = webPage
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        DetailsLoad()
        webPage.navigationDelegate = self
    
    }
    
    private func setUpWebPage() {
        webPage.navigationDelegate = self
        webPage.allowsBackForwardNavigationGestures = true
        webPage.translatesAutoresizingMaskIntoConstraints = false
    }

    private func DetailsLoad() {
        guard let idDestination = idDestination else {
            return
        }

        DestinationFetchingService.shared.getDestinationDetails(for: idDestination) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let detailsDestionation):
                self.updateView(with: detailsDestionation)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func updateView(with destination: DestinationDetails) {
        DispatchQueue.main.async {
            self.navigationItem.title = destination.name
            guard let urlLink = URL(string: destination.url.absoluteString) else { return }
            self.webPage.load(URLRequest(url: urlLink))
        }
    }
    
    
    
    
}
