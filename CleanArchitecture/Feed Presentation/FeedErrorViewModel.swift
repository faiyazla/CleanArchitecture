//
//  FeedErrorViewModel.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
