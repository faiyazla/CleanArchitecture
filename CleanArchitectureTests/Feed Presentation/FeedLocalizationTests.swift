//
//  FeedLocalizationTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 16/09/2025.
//

import XCTest
import CleanArchitecture

final class FeedLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "Feed"
        let bundle = Bundle(for: FeedPresenter.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

}
