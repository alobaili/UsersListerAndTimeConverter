//
//  UsersListViewModelTests.swift
//  UsersListerAndTimeConverterTests
//
//  Created by Abdulaziz AlObaili on 12/11/2021.
//

import XCTest
@testable import UsersListerAndTimeConverter

class UsersListViewModelTests: XCTestCase {
    func testWhenInitializingTheUsersAreEmpty() async {
        let viewModel = await UsersList.ViewModel()
        let isEmpty = await viewModel.users.isEmpty

        XCTAssertTrue(isEmpty)
    }

    func testGettingUsersSuccessfullyPopulatesUsersArray() async {
        // Arrange
        let expectedUsers = [User.fixture()]
        let usersServiceStub = UsersServiceStub { [.fixture()] }
        let viewModel = await UsersList.ViewModel(usersService: usersServiceStub)

        // Act
        await viewModel.getUsers()

        // Assert
        let users = await viewModel.users

        XCTAssertEqual(users, expectedUsers)
    }

    func testWhenGettingUsersFailsResultsInAnError() async {
        // Arraange
        let expectedError = TestError(id: 123)
        let usersServiceStub = UsersServiceStub { throw expectedError }
        let viewModel = await UsersList.ViewModel(usersService: usersServiceStub)

        // Act
        await viewModel.getUsers()

        // Assert
        let isEmpty = await viewModel.users.isEmpty
        let showingError = await viewModel.showingError

        XCTAssertTrue(isEmpty)
        XCTAssertTrue(showingError)
    }
}
