//
//  FeedStore.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 27/08/2025.
//

import Foundation

public protocol FeedStore {
    typealias DeletionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    func deleteCachedFeed(completion: @escaping DeletionCompletion)
    func insert(_ feed: [LocalFeedImage], currentDate: Date, completion: @escaping InsertionCompletion)
    func retrieve()
}

