//
//  UITableView+Dequeueing.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 16/09/2025.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
