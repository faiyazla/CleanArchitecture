//
//  SharedTestHelpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 31/08/2025.
//

import Foundation

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}
func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

extension Date {
    func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}
