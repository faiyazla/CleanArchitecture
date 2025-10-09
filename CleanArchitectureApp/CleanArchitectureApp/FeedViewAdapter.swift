//
//  FeedViewAdapter.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 16/09/2025.
//

import UIKit
import CleanArchitecture
import CleanArchitectureiOS
import Combine

final class FeedViewAdapter: ResourceView {
    private weak var controller: FeedViewController?
    private let imageLoader: (URL) -> FeedImageDataLoader.Publisher
    
    init(controller: FeedViewController, imageLoader: @escaping (URL) -> FeedImageDataLoader.Publisher) {
        self.controller = controller
        self.imageLoader = imageLoader
    }
    
    func display(_ viewModel: FeedViewModel) {
        controller?.display(viewModel.feed.map { model in
            let adapter = LoadResourcePresenterAdapter<Data, WeakRefVirtualProxy<FeedImageCellController>>(loader: { [imageLoader] in
                imageLoader(model.url)
            })
            let view = FeedImageCellController(viewModel: FeedImagePresenter.map(model),
                                               delegate: adapter)
            adapter.presenter = LoadResourcePresenter(
                errorView: WeakRefVirtualProxy(view),
                loadingView: WeakRefVirtualProxy(view),
                resourceView: WeakRefVirtualProxy(view),
                mapper: { data in
                    guard let image = UIImage(data: data) else {
                        throw InvalidImageData()
                    }
                    return image
                })
            return view
        })
    }
}
private struct InvalidImageData: Error {}
