//
//  HapticManager.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-08-23.
//

import Foundation
import SwiftUI

class HapticManager {

    static private let genertaor = UINotificationFeedbackGenerator()

    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        genertaor.notificationOccurred(type)
    }
}
