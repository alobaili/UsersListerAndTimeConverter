//
//  UsersList+ViewModel.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 10/11/2021.
//

import SwiftUI

extension UsersList {
    @MainActor class ViewModel: ObservableObject {
        let alertRetryButtonTitle: LocalizedStringKey = "Retry"

        @Published private(set) var users = [User]()

        @Published var showingError = false
        private(set) var errorTitle: LocalizedStringKey = ""
        private(set) var errorMessage: LocalizedStringKey = ""

        private var usersService: UsersProvider

        init(usersService: UsersProvider = UsersService()) {
            self.usersService = usersService
        }

        func getUsers() async {
            do {
                try await users = usersService.getUsers()
            } catch {
                print(error)
                errorTitle = "Something went wrong"
                errorMessage = "The users could not be fetched. Please try again later."
                showingError = true
            }
        }
    }
}
