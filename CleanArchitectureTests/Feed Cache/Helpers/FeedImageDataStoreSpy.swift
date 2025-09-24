//
//  FeedImageDataStoreSpy.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 24/09/2025.
//

import Foundation
import CleanArchitecture

class FeedImageDataStoreSpy: FeedImageDataStore {
    
    private var retrievalCompletions = [(FeedImageDataStore.RetrievalResult) -> Void]()
    
    enum Message: Equatable {
        case retrieve(dataFor: URL)
        case insert(data: Data, url: URL)
    }
    
    private(set) var receivedMessages = [Message]()
    
    func retrieve(dataForURL url: URL, completion: @escaping (FeedImageDataStore.RetrievalResult) -> Void) {
        receivedMessages.append(.retrieve(dataFor: url))
        retrievalCompletions.append(completion)
    }
    
    func completeRetrieval(with error: Error, at index: Int = 0) {
        retrievalCompletions[index](.failure(error))
    }
    
    func completeRetrieval(with data: Data?, at index: Int = 0) {
        retrievalCompletions[index](.success(data))
    }
    
    func insert(_ data: Data, for url: URL, completion: @escaping (FeedImageDataStore.InsertionResult) -> Void) {
        receivedMessages.append(.insert(data: data, url: url))
    }
}
