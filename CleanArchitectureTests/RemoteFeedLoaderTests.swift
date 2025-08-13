//
//  RemoteFeedLoaderTests.swift
//  CleanArchitectureTests
//
//  Created by Faiyaz Ahmed on 13/08/2025.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init() {
        _ = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requestedURL)
    }

}
