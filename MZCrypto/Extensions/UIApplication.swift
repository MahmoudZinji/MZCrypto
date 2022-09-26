//
//  UIApplication.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-07-12.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
