//
//  FeedPresenterTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

import XCTest

final class FeedPresenter {
    
    init(view: Any) {
        
    }
}

final class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessageToView() {
        let view = ViewSpy()
        _ = FeedPresenter(view: view)
        XCTAssertTrue(view.messages.isEmpty, " Expected no view messages")
    }
    
    //MARK: Helpers
    
    final class ViewSpy {
        var messages: [Any] = []
    }
}
