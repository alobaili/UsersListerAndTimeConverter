//
//  TimeConverterViewModelTests.swift
//  UsersListerAndTimeConverterTests
//
//  Created by Abdulaziz AlObaili on 14/11/2021.
//

import XCTest
@testable import UsersListerAndTimeConverter

class TimeConverterViewModelTests: XCTestCase {
    func testInputtingValidTimeOutputsNonEmptyTime() async {
        // Arrange
        let viewModel = await TimeConverterView.ViewModel()
        await viewModel.setInputTime("12:15:00AM")

        // Act
        await viewModel.convert()

        // Assert
        let convertedTime = await viewModel.convertedTime
        XCTAssertEqual(convertedTime, "00:15:00")
    }

    func testInputtingInvalidTimeCausesAnError() async {
        // Arrange
        let viewModel = await TimeConverterView.ViewModel()
        await viewModel.setInputTime("65:39:32")

        // Act
        await viewModel.convert()

        // Assert
        let showingError = await viewModel.showingError
        XCTAssertTrue(showingError)
    }
}

extension TimeConverterView.ViewModel {
    /// Because this view model is a `MainActor`, its mutating state is protected.
    /// This function is used as an `async` setter to be able to set `inputTime` during tests.
    /// This simulates the user writing a time in a text field.
    func setInputTime(_ inputTime: String) async {
        self.inputTime = inputTime
    }
}
