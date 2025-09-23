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
        let (_, view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty, " Expected no view messages")
    }
    
    //MARK: Helpers
    
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {

        let view = ViewSpy()
       let sut = FeedPresenter(view: view)
       trackForMemoryLeaks(view, file: file, line: line)
       trackForMemoryLeaks(sut, file: file, line: line)
       return (sut, view)
   }
    
    final class ViewSpy {
        var messages: [Any] = []
    }
}
