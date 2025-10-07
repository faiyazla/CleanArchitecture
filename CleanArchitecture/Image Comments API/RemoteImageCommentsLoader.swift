//
//  RemoteImageCommentsLoader.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 06/10/2025.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
    convenience init(url: URL, client: HTTPClient) {
        self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
    }
}
