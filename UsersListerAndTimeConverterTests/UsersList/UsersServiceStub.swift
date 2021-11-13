//
//  UsersServiceStub.swift
//  UsersListerAndTimeConverterTests
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

@testable import UsersListerAndTimeConverter

struct UsersServiceStub: UsersProvider {
    let result: () async throws -> [User]

    func getUsers() async throws -> [User] {
        await Task.sleep(500_000_000)
        return try await result()
    }
}
