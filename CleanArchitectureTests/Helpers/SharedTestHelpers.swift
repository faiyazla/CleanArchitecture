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
    
    func minusFeedCacheMaxAge() -> Date {
        adding(days: feedCacheMaxAgeInDays)
    }
    
    private var feedCacheMaxAgeInDays: Int {
        return -7
    }
    
    private func adding(days: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .day, value: days, to: self)!
    }
}

extension Date {
    func adding(seconds: TimeInterval) -> Date {
        return self + seconds
    }
}
