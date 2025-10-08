//
//  FeedUIIntegrationTests+Localization.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 16/09/2025.
//

import Foundation
import XCTest
import CleanArchitecture

extension FeedUIIntegrationTests {
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }

    var loadError: String {
        LoadResourcePresenter<Any, DummyView>.loadError
    }

    var feedTitle: String {
        FeedPresenter.title
    }
}
