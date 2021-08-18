//
//  FakeResponseData.swift
//  FakeResponseData
//
//  Created by Kel_Jellysh on 18/08/2021.
//

import Foundation

//MARK: Creation of a fake response data for check the API Request with a fake Data in DestionationData
class FakeResponseData {
    
    let responseOK = HTTPURLResponse(url: URL(string: "https://evaneos.fr/argentine")!, statusCode: 200, httpVersion: nil, headerFields: nil)
    let responseKO = HTTPURLResponse(url: URL(string: "https://evaneos.fr/argentine")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class DestinationError: Error {
        
        let error = DestinationError()
        
        var destinationCorrectData: Data {
            let bundle = Bundle(for: FakeResponseData.self)
            let url = bundle.url(forResource: "DestinationData", withExtension: "json")
            let data = try! Data(contentsOf: url!)
            return data
        }
        
        let destinationIncorrectData = "erreur".data(using: .utf8)!
        
        let Details = "Razawouet".data(using: .utf8)!
        
        
    }
    
    
    
    
    
}
