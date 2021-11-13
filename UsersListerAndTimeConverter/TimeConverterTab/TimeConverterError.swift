//
//  TimeConverterError.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

import Foundation

enum TimeConverterError: LocalizedError {
    case invalidInput

    var errorDescription: String? {
        switch self {
            case .invalidInput:
                return NSLocalizedString("Invalid Time", comment: "error description")
        }
    }

    var failureReason: String? {
        switch self {
            case .invalidInput:
                return NSLocalizedString(
                    "The time you entered is not real or doesn't follow the format hh:mm:ssa.",
                    comment: "failure reason"
                )
        }
    }

    var recoverySuggestion: String? {
        switch self {
            case .invalidInput:
                return NSLocalizedString(
                    "Make sure the time entered is in the format hh:mm:ssa and the components are within a valid range.",
                    comment: "recovery suggestion"
                )
        }
    }
}
