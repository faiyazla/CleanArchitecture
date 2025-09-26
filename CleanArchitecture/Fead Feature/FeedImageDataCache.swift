//
//  FeedImageDataCache.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 26/09/2025.
//

import Foundation

public protocol FeedImageDataCache {
    typealias Result = Swift.Result<Void, Error>
    func save(_ data: Data, for url: URL, completion: @escaping (Result) -> Void)
}
