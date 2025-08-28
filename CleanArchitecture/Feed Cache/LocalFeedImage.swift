//
//  LocalFeedImage.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 28/08/2025.
//

import Foundation

public struct LocalFeedImage: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let url: URL
    
    public init(id: UUID, description: String?, location: String?, url: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.url = url
    }
}
