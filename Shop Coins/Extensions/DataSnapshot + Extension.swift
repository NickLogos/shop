//
//  DataSnapshot + Extension.swift
//  Shop Coins
//
//  Created by Nick Logos on 22.10.23.
//

import Foundation
import Firebase

extension DataSnapshot {
    var valueToJSON: Data {
        guard let dictionary = value as? [String: Any] else {
            return Data()
        }
        return dictionary.JSON
    }
    
    var listToJSON: Data {
        guard let object = children.allObjects as? [DataSnapshot] else {
            return Data()
        }
        
        let dictionary: [NSDictionary] = object.compactMap { $0.value as? NSDictionary }
        
        do {
            return try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
        } catch {
            return Data()
        }
    }
}
