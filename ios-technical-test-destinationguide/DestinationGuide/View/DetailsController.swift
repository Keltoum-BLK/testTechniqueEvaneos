//
//  DetailsController.swift
//  DetailsController
//
//  Created by Kel_Jellysh on 17/08/2021.
//

import UIKit
import WebKit

class DetailsController: UIViewController, WKNavigationDelegate {
 //MARK: Variables using to run the webView
    private var activityIndicator = UIActivityIndicatorView(style: .large)
    private var webPage:WKWebView = {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    var idDestination: String?
    
    override func loadView() {
        super.loadView()
        view = webPage
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = "Back"
        DetailsLoad()
        webPage.navigationDelegate = self
    
    }
  //MARK: SetUp the webView and recover the data to load webView and webView's title
    private func DetailsLoad() {
        guard let idDestination = idDestination else { return }

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
    
    func activitySetup() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        webPage.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: webPage.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: webPage.centerYAnchor).isActive = true
    }
    
    
}
