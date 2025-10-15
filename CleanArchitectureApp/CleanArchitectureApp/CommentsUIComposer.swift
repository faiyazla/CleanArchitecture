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
    
    private typealias CommentsPresentationAdapter = LoadResourcePresentationAdapter<[ImageComment], CommentsViewAdapter>
    
    public static func commentsComposedWith(commentsLoader: @escaping () -> AnyPublisher<[ImageComment], Error>) -> ListViewController {
        let presentationAdapter = CommentsPresentationAdapter(loader:  commentsLoader)
        
        let commentController = makeWith(title: ImageCommentsPresenter.title)
        commentController.onRefresh = presentationAdapter.loadResource
        
        let presenter = LoadResourcePresenter(errorView: WeakRefVirtualProxy(commentController),
                                              loadingView: WeakRefVirtualProxy(commentController),
                                              resourceView: CommentsViewAdapter(controller: commentController),
                                              mapper: ImageCommentsPresenter.map)
        presentationAdapter.presenter = presenter
        return commentController
    }
    
    private static func makeWith(title: String) -> ListViewController {
        let bundle = Bundle(for: ListViewController.self)
        let storyboard = UIStoryboard(name: "ImageComment", bundle: bundle)
        let controller = storyboard.instantiateInitialViewController() as! ListViewController
        controller.title = title
        return controller
    }
}


final class CommentsViewAdapter: ResourceView {
    private weak var controller: ListViewController?
    
    init(controller: ListViewController) {
        self.controller = controller
    }
    
    func display(_ viewModel: ImageCommentsViewModel) {
        controller?.display(viewModel.comments.map({ viewModel in
            CellController(id: viewModel, ImageCommentCellController(model: viewModel))
        }))
    }
}

