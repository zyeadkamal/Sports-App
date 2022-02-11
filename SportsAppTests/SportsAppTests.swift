//
//  SportsAppTests.swift
//  SportsAppTests
//
//  Created by mac on 2/11/22.
//  Copyright © 2022 mac. All rights reserved.
//

import XCTest
@testable import Sports_App

class SportsAppTests: XCTestCase {
    var networkManager = NetworkManager()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAllSportsFromURL() {
        let expectaion = expectation(description: "Waiting for the API")
        networkManager.request(fromEndpoint: .allSports, httpMethod: .post, parametrs: [:]) { [weak self] (result:Result<AllSportsResponse, Error>) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.sports?.count, 34, "API Faild")
                expectaion.fulfill()
            case .failure(let error):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }
    
    func testAllLeaguesFromURL() {
        let expectaion = expectation(description: "Waiting for the API")
        networkManager.request(fromEndpoint: EndPoint.allLeagues, httpMethod: .post, parametrs: ["s":"Soccer"]){ [weak self] (result:Result<AllLeagues, Error>) in
            
            switch result {
            case .success(let response):
                XCTAssertEqual(response.countrys?.count, 10, "API Failed")
                expectaion.fulfill()
                break
            case .failure(let error):
                XCTFail()
                break
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
        
    }

}
