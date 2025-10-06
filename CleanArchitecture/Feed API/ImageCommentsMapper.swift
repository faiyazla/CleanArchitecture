//
//  ImageCommentsMapper.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 06/10/2025.
//

import Foundation

internal class ImageCommentsMapper {
    
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    private static var OK_200: Int {
        return 200
    }
    
    internal static func map(_ data: Data, _ response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard isOk(response), let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteImageCommentsLoader.Error.invalidData
        }
        return root.items
    }
    
    static func isOk(_ response: HTTPURLResponse) -> Bool {
        (200...299).contains(response.statusCode)
    }
}
