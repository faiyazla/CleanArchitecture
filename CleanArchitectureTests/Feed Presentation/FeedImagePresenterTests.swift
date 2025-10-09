//
//  FeedImagePresenterTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

import XCTest
import CleanArchitecture

class FeedImagePresenterTests: XCTestCase {
    
    func test_map_createsViewModels() {
        let image = uniqueImage()
        
        let viewModel = FeedImagePresenter.map(image)
        
        XCTAssertEqual(viewModel.description, image.description)
        XCTAssertEqual(viewModel.location, image.location)
    }
}
