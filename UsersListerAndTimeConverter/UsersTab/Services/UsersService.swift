//
//  UsersService.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 12/11/2021.
//

import Foundation
import NetworkManager
import Algorithms

protocol UsersProvider {
    func getUsers() async throws -> [User]
}

/// A service represents a remote service that can be used.
/// The service specifies how JSON keys should be decoded and
/// has an instance of the `NetworkManager`. This hides implementation
/// details about how the JSON keys look like and
/// how the requests and responses are handled.
struct UsersService: UsersProvider {
    private var jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return decoder
    }()

    private var networkManager: NetworkManager

    init() {
        networkManager = NetworkManager(jsonDecoder: jsonDecoder)
    }

    func getUsers() async throws -> [User] {
        let posts: [Post] = try await networkManager.execute(Endpoint.posts)
        let users = posts.map { $0.user }
        let uniqueUsers = users.uniqued()

        return Array(uniqueUsers)
    }
}
