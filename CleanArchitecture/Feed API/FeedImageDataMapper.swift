//
//  FeedImageDataMapper.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 07/10/2025.
//

import Foundation

public final class FeedImageDataMapper {
     public enum Error: Swift.Error {
        case invalidData
    }

    public static func map(_ data: Data, from response: HTTPURLResponse) throws -> Data {
        guard response.isOK, !data.isEmpty else {
            throw Error.invalidData
        }
        return data
    }
}
