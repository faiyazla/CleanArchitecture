//
//  RemoteFeedItem.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 28/08/2025.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
