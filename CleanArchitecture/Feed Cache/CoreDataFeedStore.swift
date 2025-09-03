//
//  CoreDataFeedStore.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 03/09/2025.
//

import CoreData

public final class CoreDataFeedStore: FeedStore {
    
    public init(){}
    
    public func deleteCachedFeed(completion: @escaping DeletionCompletion) {
        
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
}
