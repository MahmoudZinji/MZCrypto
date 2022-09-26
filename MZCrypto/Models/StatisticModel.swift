//
//  StatisticModel.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-07-12.
//

import Foundation

struct StatisticModel: Identifiable, Codable {

    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?

    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
