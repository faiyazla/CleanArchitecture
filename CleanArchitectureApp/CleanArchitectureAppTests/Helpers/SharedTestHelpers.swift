//
//  SharedTestHelpers.swift
//  CleanArchitectureApp
//
//  Created by Faiyaz Ahmed on 25/09/2025.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any data".utf8)
}

func anyURL() -> URL {
    return URL(string: "http://a-url.com")!
}
