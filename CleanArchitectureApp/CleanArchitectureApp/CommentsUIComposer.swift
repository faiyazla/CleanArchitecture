//
//  CommentsUIComposer.swift
//  CleanArchitectureApp
//
//  Created by Faiyaz Ahmed on 15/10/2025.
//

import CleanArchitecture
import UIKit
import CleanArchitectureiOS
import Combine

public final class CommentsUIComposer {
    private init() {}
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<[FeedImage], FeedViewAdapter>
    
    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>) -> ListViewController {
        let presentationAdapter = FeedPresentationAdapter(loader:  feedLoader)
        
        let feedController = makeWith(title: FeedPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource
        
        let presenter = LoadResourcePresenter(errorView: WeakRefVirtualProxy(feedController),
                                      loadingView: WeakRefVirtualProxy(feedController),
                                      resourceView: FeedViewAdapter(controller: feedController,
                                                                    imageLoader: { _ in Empty<Data, Error>().eraseToAnyPublisher() } ),
                                              mapper: FeedPresenter.map)
        presentationAdapter.presenter = presenter
        return feedController
    }
    
    private static func makeWith(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! ListViewController
        feedController.title = title
        return feedController
    }
}




