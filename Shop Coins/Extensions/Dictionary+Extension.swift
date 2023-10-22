//
//  Dictionary+Extension.swift
//  Shop Coins
//
//  Created by Nick Logos on 22.10.23.
//

import Foundation

extension Dictionary {
    var JSON: Data {
        do {
            return try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
