//
//  FeedViewController.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 09/09/2025.
//

import UIKit
import CleanArchitecture

final public class FeedViewController: UITableViewController {
    
    private var loader: FeedLoader?
    private var onViewIsAppearing: ((FeedViewController) -> Void)?
        
    public convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
        onViewIsAppearing = { vc in
            vc.refresh()
            vc.onViewIsAppearing = nil
        }
        load()
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        
        onViewIsAppearing?(self)
    }
    
    @objc func load() {
        loader?.load  { [weak self]  _ in
            self?.refreshControl?.endRefreshing()
        }
    }
    
    @objc func refresh() {
        refreshControl?.beginRefreshing()
        load()
    }
}
public extension FeedViewController {
    
    func simulateAppearance() {
        if !isViewLoaded {
            loadViewIfNeeded()
            replaceRefreshControlWithFakeOrIOS17Support()
        }
        beginAppearanceTransition(true, animated: false)//viewWillAppear
        endAppearanceTransition() //viewIsAppearing+viewDidAppear
    }
    
    func replaceRefreshControlWithFakeOrIOS17Support() {
        let fake = FakeRefreshControl()
        refreshControl?.allTargets.forEach { target in
            refreshControl?.actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                action in
                fake.addTarget(target, action: Selector(action), for: .valueChanged)
            }
        }
        refreshControl = fake
    }
}

public extension FeedViewController {
    func simulateUserInitiatedFeedReload() {
        refreshControl?.simulatePullToRefresh()
    }
    
    var isShowingLoadingIndicator: Bool {
        refreshControl?.isRefreshing == true
    }
}

private extension UIRefreshControl {
    
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                _ = (target as AnyObject).perform(Selector($0))
            }
        }
    }
}
private class FakeRefreshControl: UIRefreshControl {
    private var _isRefreshing = false
    
    override var isRefreshing: Bool { _isRefreshing }
    
    override func beginRefreshing() {
        _isRefreshing = true
    }
    
    override func endRefreshing() {
        _isRefreshing = false
    }
}
