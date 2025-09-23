//
//  FeedPresenterTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

import XCTest

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
 }

struct FeedLoadingViewModel {
    let isLoading: Bool
}


protocol FeedLoadingView {
    func display(_ viewModel: FeedLoadingViewModel)
}
protocol FeedErrorView {
    func display(_ viewModel: FeedErrorViewModel)
}

final class FeedPresenter {
    
    private let errorView: FeedErrorView
    private let loadingView: FeedLoadingView

    init(errorView: FeedErrorView, loadingView: FeedLoadingView) {
        self.errorView = errorView
        self.loadingView = loadingView
    }
    
    func didStartLoadingFeed() {
        errorView.display(.noError)
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
}

final class FeedPresenterTests: XCTestCase {
    
    func test_init_doesNotSendMessageToView() {
        let (_, view) = makeSUT()
        XCTAssertTrue(view.messages.isEmpty, " Expected no view messages")
    }
    
    func test_didStartLoadingFeed_displaysNoErrorMessageAndStartsLoading() {
        let (sut, view) = makeSUT()
        
        sut.didStartLoadingFeed()
        
        XCTAssertEqual(view.messages, [.display(errorMessage: .none), .display(isLoading: true)])
    }
    
    
    //MARK: Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedPresenter, view: ViewSpy) {

        let view = ViewSpy()
        let sut = FeedPresenter(errorView: view, loadingView: view)
       trackForMemoryLeaks(view, file: file, line: line)
       trackForMemoryLeaks(sut, file: file, line: line)
       return (sut, view)
   }
    
    final class ViewSpy: FeedErrorView, FeedLoadingView {
        var messages: [Message] = []
        
        enum Message: Equatable {
            case display(errorMessage: String?)
            case display(isLoading: Bool)
        }
        
        func display(_ viewModel: FeedErrorViewModel) {
            messages.append(.display(errorMessage: viewModel.message))
        }
        
        func display(_ viewModel: FeedLoadingViewModel) {
            messages.append((.display(isLoading: viewModel.isLoading)))
        }
    }
}
