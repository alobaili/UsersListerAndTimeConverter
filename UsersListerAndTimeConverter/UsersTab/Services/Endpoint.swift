//
//  Endpoint.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 10/11/2021.
//

import Foundation
import NetworkManager

enum Endpoint {
    case posts
}

extension Endpoint: RequestProvider {
    var urlRequest: URLRequest {
        switch self {
            case .posts:
                return URLRequest(url: URL(string: "https://pastebin.com/raw/wgkJgazE")!)
        }
    }
}
