//
//  RemoteFeedLoaderTests.swift
//  CleanArchitectureTests
//
//  Created by Faiyaz Ahmed on 13/08/2025.
//

import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!) 
    }
}

class HTTPClient {
    
    static var shared = HTTPClient()
    
    func get(from url: URL) {}
}
class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        requestedURL = url
    }

}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
