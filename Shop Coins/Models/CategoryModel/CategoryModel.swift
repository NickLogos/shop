//
//  CategoryModel.swift
//  Shop Coins
//
//  Created by Nick Logos on 22.10.23.
//

import Foundation
import SwiftyJSON

class CategoryModel: Codable {
    var armorWeapons: String?
    var candles: String?
    var collectionFigures: String?
    var collectionCups: String?
    var handMade: String?
    var homeDecore: String?
    var jewellery: String?
    
    init(dict: [String: Any]) throws {
            self.armorWeapons = dict["armor_weapons"] as? String
            self.candles = dict["candles"] as? String
            self.collectionFigures = dict["collection_figures"] as? String
            self.collectionCups = dict["collection_cups"] as? String
            self.handMade = dict["hand_made"] as? String
            self.homeDecore = dict["home_decore"] as? String
            self.jewellery = dict["jewellery"] as? String
        }
}

