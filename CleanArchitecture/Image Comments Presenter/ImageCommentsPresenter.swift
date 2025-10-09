//
//  ImageCommentsPresenter.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 09/10/2025.
//

import Foundation

public final class ImageCommentsPresenter {
    
    public static var title: String {
        NSLocalizedString("IMAGE_COMMENTS_VIEW_TITLE",
            tableName: "ImageComments",
            bundle: Bundle(for: Self.self),
            comment: "Title for the image comments view")
    }
}
