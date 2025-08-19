//
//  FeedLoader.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 12/08/2025.
//

public enum LoadFeedResult<Error: Swift.Error> {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    associatedtype Error: Swift.Error
    func load(completion: @escaping (LoadFeedResult<Error>) -> Void)
}
