//
//  UIRefreshControl+Helpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 22/09/2025.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing(): endRefreshing()
    }
}
