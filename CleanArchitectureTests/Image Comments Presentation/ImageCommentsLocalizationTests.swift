//
//  ImageCommentsLocalizationTests.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 09/10/2025.
//

import XCTest
import CleanArchitecture

class ImageCommentsLocalizationTests: XCTestCase {

    func test_localizedStrings_haveKeysAndValuesForAllSupportedLocalizations() {
        let table = "ImageComments"
        let bundle = Bundle(for: ImageCommentsPresenter.self)

        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }

}
