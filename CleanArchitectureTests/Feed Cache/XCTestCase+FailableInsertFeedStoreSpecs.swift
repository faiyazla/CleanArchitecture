//
//  XCTestCase+FailableRetrieveFeedStoreSpecs.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 02/09/2025.
//

import XCTest
import CleanArchitecture

extension FailableInsertFeedStoreSpecs where Self: XCTestCase {
    
    
    func assertThatInsertDeliversErrorOnInsertionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        let insertionError = insert((uniqueImageFeed().local, Date()), to: sut)
        
        XCTAssertNotNil(insertionError, "Expected cache insertion to fail with an error", file: file, line: line)
    }
    
    func assertThatInsertHasNoSideEffectsOnInsertionError(on sut: FeedStore, file: StaticString = #file, line: UInt = #line) {
        insert((uniqueImageFeed().local, Date()), to: sut)
        
        expect(sut, toRetrieve: .empty, file: file, line: line)
    }
}
