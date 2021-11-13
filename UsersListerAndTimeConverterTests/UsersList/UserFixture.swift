//
//  UserFixture.swift
//  UsersListerAndTimeConverterTests
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

@testable import UsersListerAndTimeConverter

extension User {
    static func fixture(
        id: String = "1234",
        name: String = "Abdulaziz Alobaili",
        profileImage: ProfileImage = .init(large: "https://pbs.twimg.com/profile_images/750611919468453889/L7hoLlMM_400x400.jpg")
    ) -> User {
        User(id: id, name: name, profileImage: profileImage)
    }
}
