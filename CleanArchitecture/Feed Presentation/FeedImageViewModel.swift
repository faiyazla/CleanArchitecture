//
//  FeedImageViewModel.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 23/09/2025.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
