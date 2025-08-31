//
//  FeedCacheTestHelpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 31/08/2025.
//

import Foundation
import CleanArchitecture

func uniqueImageFeed() -> (models: [FeedImage], local: [LocalFeedImage]) {
    let models = [uniqueImage(), uniqueImage()]
    let local = models.map { LocalFeedImage(id: $0.id,
                                           description: $0.description,
                                           location: $0.location,
                                           url: $0.url) }
    return (models, local)
}

func uniqueImage() -> FeedImage {
    return FeedImage(id: UUID(), description: "any", location: "any", url: anyURL())
}
