//
//  FeedViewModel.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 14/09/2025.
//

import CleanArchitecture

final class FeedViewModel {
    private let feedLoader: FeedLoader
    
    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }
    
    private(set) var isLoading: Bool = false {
        didSet { onChanged?(self) }
    }
    
    var onChanged: ((FeedViewModel) -> Void)?
    var onFeedLoad: (([FeedImage]) -> Void)?
    
    func loadFeed() {
        isLoading = true
        feedLoader.load { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.isLoading = false
        }
    }
}
