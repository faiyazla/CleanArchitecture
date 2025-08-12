//
//  FeedLoader.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 12/08/2025.
//

enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
