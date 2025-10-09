//
//  FeedImagePresenter.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//


import Foundation

public final class FeedImagePresenter {
 
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
              description: image.description,
              location: image.location)
    }
}
