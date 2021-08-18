//
//  DestinationFletchingServiceTest.swift
//  DestinationFletchingServiceTest
//
//  Created by Kel_Jellysh on 18/08/2021.
//

import XCTest
@testable import DestinationGuide

class DestinationFletchingServiceTest: XCTestCase {
    //MARK: Variables to access to the methods for the unit tests
    var destinationFletch: DestinationFetchingService!
    var destination: Destination!
    
    override func setUp() {
        super.setUp()
        destinationFletch = DestinationFetchingService()
        destination = Destination(id: "", name: "", picture: (URL(string: ""))!, tag: "", rating: 0)
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        destinationFletch = nil
    }


    func testGivenAId_WhenCallFakeApi_ThenGetDestinationId() {
        
}

}
