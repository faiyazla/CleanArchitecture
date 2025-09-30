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

        XCTAssertEqual(app.cells.count, 22)
        XCTAssertEqual(app.cells.firstMatch.images.count, 1)
    }
}
