//
//  CleanArchitectureAppUIAcceptanceTests.swift
//  CleanArchitectureAppUIAcceptanceTests
//
//  Created by Faiyaz Ahmed on 29/09/2025.
//

import XCTest

final class CleanArchitectureAppUIAcceptanceTests: XCTestCase {

    func test_onLaunch_displaysRemoteFeedWhenCustomerHasConnectivity() {
        let app = XCUIApplication()

        app.launch()

        let feedCells = app.cells.matching(identifier: "feed-image-cell")
        XCTAssertEqual(feedCells.count, 22)
        
        let firstImage = app.images.matching(identifier: "feed-image-view").firstMatch
        XCTAssertTrue(firstImage.exists)
    }
}
