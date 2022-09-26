//
//  Date.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-08-26.
//

import Foundation

extension Date {

    //2021-03-13T20:49:26.606Z
    init(coinGeckoString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        let date = formatter.date(from: coinGeckoString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }

    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }

    private var mediumFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }

    private var longFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }

    func asMediumDateString() -> String {
        return mediumFormatter.string(from: self)
    }

    func asLongDateString() -> String {
        return longFormatter.string(from: self)
    }
}
