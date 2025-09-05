//
//  FeedLoader.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 12/08/2025.
//

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
