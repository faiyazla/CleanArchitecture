//
//  UIView+TestHelpers.swift
//  CleanArchitectureApp
//
//  Created by Faiyaz Ahmed on 01/10/2025.
//

import UIKit

extension UIView {
     func enforceLayoutCycle() {
        layoutIfNeeded()
         RunLoop.current.run(until: Date())
    }
}
