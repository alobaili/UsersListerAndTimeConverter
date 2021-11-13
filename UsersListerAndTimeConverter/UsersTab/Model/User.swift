//
//  User.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 10/11/2021.
//

import Foundation
import NetworkManager

struct User: Decodable, Identifiable, Hashable {
    let id: String
    let name: String
    let profileImage: ProfileImage

    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#if DEBUG
extension User {
    static let example: User = {
        let profileImage = ProfileImage(large: "https://images.unsplash.com/profile-1464495186405-68089dcd96c3?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=128&w=128&s=622a88097cf6661f84cd8942d851d9a2")

        return User(id: "OevW4fja2No", name: "Nicholas Kampouris", profileImage: profileImage)
    }()
}
#endif
