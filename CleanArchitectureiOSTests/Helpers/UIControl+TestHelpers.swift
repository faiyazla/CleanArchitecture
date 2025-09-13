//
//  UIControl+TestHelpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                _ = (target as AnyObject).perform(Selector($0))
            }
        }
    }
}
