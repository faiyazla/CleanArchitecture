//
//  UIButton+TestHelpers.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
