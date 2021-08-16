//
//  DestinationDetailsController.swift
//  DestinationDetailsController
//
//  Created by Kel_Jellysh on 15/08/2021.
//

import UIKit
import WebKit
class DestinationDetailsController: UIViewController {

    
    @IBOutlet weak var webPage : WKWebView!
    
    var idDestination: String?
    var travelDetails: [DestinationDetails]?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        DestinationFetchingService.shared.getDestinationDetails(for: idDestination ?? "") { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.travelDetails = Array(arrayLiteral: details)
                    self.webPage.reload()
                    self.navigationItem.title = details.name
                }
            case .failure(_):
                return
            }
        }
        
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
