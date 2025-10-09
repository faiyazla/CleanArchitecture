//
//  FeedUIComposer.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import CleanArchitecture
import UIKit
import CleanArchitectureiOS
import Combine

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<[FeedImage], Error>, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader:  feedLoader)
        
        let feedController = makeWith(delegate: presentationAdapter, title: FeedPresenter.title)
        
        let presenter = LoadResourcePresenter(errorView: WeakRefVirtualProxy(feedController),
                                      loadingView: WeakRefVirtualProxy(feedController),
                                      resourceView: FeedViewAdapter(controller: feedController,
                                                                    imageLoader: imageLoader),
                                              mapper: FeedPresenter.map)
        presentationAdapter.presenter = presenter
        return feedController
    }
    
    private static func makeWith(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.title = title
        feedController.delegate = delegate
        return feedController
    }
}




