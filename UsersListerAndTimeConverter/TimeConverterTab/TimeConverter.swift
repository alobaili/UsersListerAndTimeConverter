//
//  TimeConverter.swift
//  UsersListerAndTimeConverter
//
//  Created by Abdulaziz AlObaili on 13/11/2021.
//

import Foundation

struct TimeConverter {
    private let formatter12HourTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ssaa"

        return formatter
    }()

    private let formatter24HourTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"

        return formatter
    }()

    func convertTo24HourTime(_ timeIn12Hour: String) throws -> String {
        guard let date = formatter12HourTime.date(from: timeIn12Hour) else {
            throw TimeConverterError.invalidInput
        }

        let timeIn24Hour = formatter24HourTime.string(from: date)

        return timeIn24Hour
    }
}
