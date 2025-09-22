//
//  FeedErrorViewModel.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 22/09/2025.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
 }
