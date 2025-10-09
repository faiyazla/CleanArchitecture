//
//  FeedPresenter.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

import Foundation

public final class FeedPresenter {
    
    public static var title: String {
        return NSLocalizedString("FEED_VIEW_TITLE",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Title for the feed view")
    }
    
    public static func map(_ feed: [FeedImage]) -> FeedViewModel {
        FeedViewModel(feed: feed)
    }
}
