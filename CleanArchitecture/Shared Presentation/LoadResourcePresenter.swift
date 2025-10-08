//
//  LoadResourcePresenter.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 08/10/2025.
//

import Foundation

public protocol ResourceView {
    func display(_ viewModel: String)
}

public final class LoadResourcePresenter {
    
    public typealias Mapper = (String) -> String
    
    private let resourceView: ResourceView
    private let mapper: Mapper
    private let errorView: FeedErrorView
    private let loadingView: FeedLoadingView
    
    public init(errorView: FeedErrorView, loadingView: FeedLoadingView, resourceView: ResourceView, mapper: @escaping Mapper) {
        self.errorView = errorView
        self.loadingView = loadingView
        self.resourceView = resourceView
        self.mapper = mapper
    }
    
    private var feedLoadError: String {
        return NSLocalizedString("FEED_VIEW_CONNECTION_ERROR",
                                 tableName: "Feed",
                                 bundle: Bundle(for: FeedPresenter.self),
                                 comment: "Error message displayed when we can't load the image feed from the server")
    }
    
    public func didStartLoading() {
        errorView.display(.noError)
        loadingView.display(FeedLoadingViewModel(isLoading: true))
    }
    
    public func didFinishLoading(with resource: String) {
        loadingView.display(FeedLoadingViewModel(isLoading: false))
        resourceView.display(mapper(resource))
    }
    
    public func didFinishLoadingFeed(with error: Error) {
        errorView.display(.error(message: feedLoadError))
        loadingView.display(FeedLoadingViewModel(isLoading: false))
    }
}
