//
//  TimeConverterViewModel.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

import SwiftUI

extension TimeConverterView {
    @MainActor class ViewModel: ObservableObject {
        let convertButtonTitle: LocalizedStringKey = "Convert"
        let textFieldPrompt: LocalizedStringKey = "Enter a time like 04:15:00 am"

        @Published var inputTime = ""
        @Published var convertedTime = ""

        @Published var showingError = false
        var errorTitle: String = ""
        var errorMessage: String = ""

        private let timeConverter = TimeConverter()

        func convert() {
            do {
                convertedTime = try timeConverter.convertTo24HourTime(inputTime)
            } catch let error as TimeConverterError {
                handleTimeConverterError(error)
            } catch {
                errorTitle = NSLocalizedString("An error occured", comment: "error title")
                errorMessage = error.localizedDescription
            }
        }

        private func handleTimeConverterError(_ error: TimeConverterError) {
            guard
                let errorDescription = error.errorDescription,
                let failureReason = error.failureReason,
                let recoverySuggestion = error.recoverySuggestion
            else {
                return
            }

            errorTitle = errorDescription
            errorMessage = "\(failureReason) \(recoverySuggestion)"
            showingError = true
        }
    }
}
