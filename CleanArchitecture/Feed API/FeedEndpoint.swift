//
//  FeedEndpoint.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 16/10/2025.
//


import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
