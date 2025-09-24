//
//  HTTPURLResponse+StatusCode.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 24/09/2025.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
