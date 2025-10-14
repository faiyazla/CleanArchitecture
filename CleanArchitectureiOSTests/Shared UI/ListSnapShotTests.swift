//
//  ListSnapShotTests.swift
//  CleanArchitectureiOSTests
//
//  Created by Faiyaz Ahmed on 13/10/2025.
//

import XCTest
import CleanArchitectureiOS
@testable import CleanArchitecture

final class ListSnapShotTests: XCTestCase {

    func test_emptyFeed() {
        let sut = makeSUT()

        sut.display(emptyFeed())

        assert(snapshot: sut.snapshot(for: .iPhone16Pro(style: .light)), named: "EMPTY_FEED_light")
        assert(snapshot: sut.snapshot(for: .iPhone16Pro(style: .dark)), named: "EMPTY_FEED_dark")
    }
    
    func test_feedWithErrorMessage() {
        let sut = makeSUT()
        
        sut.display(.error(message: "This is a \nmulti-line\nerror message"))
        
        assert(snapshot: sut.snapshot(for: .iPhone16Pro(style: .light)), named: "FEED_WITH_ERROR_MESSAGE_light")
        assert(snapshot: sut.snapshot(for: .iPhone16Pro(style: .dark)), named: "FEED_WITH_ERROR_MESSAGE_dark")
    }

    // MARK: - Helpers

    private func makeSUT() -> ListViewController {
        let controller = ListViewController()
        controller.loadViewIfNeeded()
        controller.tableView.separatorStyle = .none
        controller.tableView.showsVerticalScrollIndicator = false
        controller.tableView.showsHorizontalScrollIndicator = false
        return controller
    }

    private func emptyFeed() -> [CellController] {
        return []
    }
    
}
