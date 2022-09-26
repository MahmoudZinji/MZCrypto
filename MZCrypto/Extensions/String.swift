//
//  String.swift
//  MZCrypto
//
//  Created by Mahmoud Zinji on 2022-08-26.
//

import Foundation

extension String {

    var removingHTMLOccurences: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
}
