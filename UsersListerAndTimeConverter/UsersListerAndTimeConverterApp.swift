//
//  UsersListerAndTimeConverterApp.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 10/11/2021.
//

import SwiftUI

@main
struct UsersListerAndTimeConverterApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                UsersList()
                    .tabItem {
                        Label("Users", systemImage: "person.3.sequence")
                    }
            }
        }
    }
}
