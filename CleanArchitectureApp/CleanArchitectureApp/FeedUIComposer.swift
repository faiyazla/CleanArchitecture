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
    
    private typealias FeedPresentationAdapter = LoadResourcePresentationAdapter<Paginated<FeedImage>, FeedViewAdapter>
    
    public static func feedComposedWith(feedLoader: @escaping () -> AnyPublisher<Paginated<FeedImage>, Error>,
                                        imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher,
                                        selection: @escaping (FeedImage) -> Void = { _ in }
    ) -> ListViewController {
        let presentationAdapter = FeedPresentationAdapter(loader:  feedLoader)
        
        let feedController = makeWith(title: FeedPresenter.title)
        feedController.onRefresh = presentationAdapter.loadResource
        
        let presenter = LoadResourcePresenter(resourceView: FeedViewAdapter(controller: feedController,
                                                           imageLoader: imageLoader,
                                                          selection: selection),
                              loadingView: WeakRefVirtualProxy(feedController),
                              errorView: WeakRefVirtualProxy(feedController))
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




