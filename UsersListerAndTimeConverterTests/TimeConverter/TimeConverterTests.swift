//
//  TimeConverterTests.swift
//  UsersListerAndTimeConverterTests
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

import XCTest
@testable import UsersListerAndTimeConverter

class TimeConverterTests: XCTestCase {
    func testValidTimeIsConvertedSuccessfully() throws {
        let validInput = "09:00:00PM"
        let expectedOutput = "21:00:00"
        let timeConverter = TimeConverter()

        let converted = try timeConverter.convertTo24HourTime(validInput)

        XCTAssertEqual(converted, expectedOutput)
    }

    func testInvalidTimeThrowsInvalidInput() {
        let expectedError = TimeConverterError.invalidInput

        let invalidInput = "09:00:00"

        let timeConverter = TimeConverter()

        XCTAssertThrowsError(
            try timeConverter.convertTo24HourTime(invalidInput),
            "The function should throw."
        ) { error in
            guard let error = error as? TimeConverterError else {
                XCTFail("The thrown error must be of type TimeConverterError.")
                return
            }

            XCTAssertEqual(error, expectedError)
        }
    }
}
