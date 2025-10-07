//
//  RemoteFeedLoader.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 14/08/2025.
//

import Foundation

public typealias RemoteFeedLoader = RemoteLoader<[FeedImage]>

public extension RemoteFeedLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: FeedItemsMapper.map)
    }
}
