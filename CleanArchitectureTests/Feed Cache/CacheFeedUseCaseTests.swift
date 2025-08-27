//
//  CacheFeedUseCaseTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 27/08/2025.
//

import XCTest

class LocalFeedLoader {

    init(store: FeedStore) {
    }
}

class FeedStore {
    
    var deleteCachedFeedCallCount = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        let _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
