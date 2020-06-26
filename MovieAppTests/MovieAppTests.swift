//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Matheus Leite on 19/06/20.
//  Copyright © 2020 Matheus Leite. All rights reserved.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {
    var network = MovieNetwork.shared

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetMoviesRequest() throws {
        var requestData: Any?
        var responseError: Error?

        let promise = expectation(description: "Completion handler invoked")
        
        network.getMovies(endpoint: "/movie/popular") { (result: Result<MoviesResponse, MovieNetwork.NetworkError>) in
            switch result {
                case .success(let movieResponse):
                    requestData = movieResponse
                    promise.fulfill()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    responseError = error
            }
        }
        
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(requestData)
    }
    
    func testGetMovieInfoRequest() throws {
        var requestData: Any?
        var responseError: Error?

        let promise = expectation(description: "Completion handler invoked")
        
        network.getMovieInfo(endpoint: "/movie/475430") { (result: Result<MovieInfo, MovieNetwork.NetworkError>) in
            switch result {
                case .success(let movieResponse):
                    requestData = movieResponse
                    promise.fulfill()
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    responseError = error
            }
        }
        
        wait(for: [promise], timeout: 5)

        // then
        XCTAssertNil(responseError)
        XCTAssertNotNil(requestData)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
