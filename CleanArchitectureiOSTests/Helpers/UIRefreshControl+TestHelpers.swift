//
//  UIRefreshControl+TestHelpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import UIKit

extension UIRefreshControl {    
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach {
                _ = (target as AnyObject).perform(Selector($0))
            }
        }
    }
}
