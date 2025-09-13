//
//  Untitled.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import UIKit
import CleanArchitectureiOS

extension FeedImageCell {
    
    func simulateRetryAction() {
        feedImageRetryButton.simulateTap()
    }
    
   var isShowingLocation: Bool {
       return !locationContainer.isHidden
   }
    
    var isShowingImageLoadingIndicator: Bool {
        return feedImageContainer.isShimmering
    }
    
    var isShowingRetryAction: Bool {
        return !feedImageRetryButton.isHidden
    }

   var locationText: String? {
       return locationLabel.text
   }

   var descriptionText: String? {
       return descriptionLabel.text
   }
    
    var renderedImage: Data? {
        return feedImageView.image?.pngData()
    }
}



