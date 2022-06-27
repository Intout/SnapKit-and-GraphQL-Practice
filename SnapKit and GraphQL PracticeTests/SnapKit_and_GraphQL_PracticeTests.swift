//
//  SnapKit_and_GraphQL_PracticeTests.swift
//  SnapKit and GraphQL PracticeTests
//
//  Created by Mert Tecimen on 25.06.2022.
//

import XCTest
@testable import SnapKit_and_GraphQL_Practice

class SnapKit_and_GraphQL_PracticeTests: XCTestCase {

    func testDataFetchingFromRestAPI() throws{

        
        
        let expectation = expectation(description: "Fetch data from RestAPI")
        SnapKit_and_GraphQL_Practice.ApolloQueryHelper.shared.apollo.fetch(query: CharactersQuery()){ result in
            switch result{
            case .success(_):
                XCTAssert(true, "Success!")
                expectation.fulfill()
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    
    func testDownloadingImage() throws{
        let url = URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!
        let expectation = expectation(description: "Download image from URL.")
        
        Networking.downloadImage(url: url){ result in
            switch result{
            case .success(_):
                XCTAssert(true, "Success!")
                expectation.fulfill()
            case .failure(let error):
                XCTAssert(false, error.localizedDescription)
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 5)
        
    }

}
