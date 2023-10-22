//
//  FireBaseDBmanager.swift
//  Shop Coins
//
//  Created by Nick Logos on 18.10.23.
//

import Foundation
import FirebaseDatabase
import SwiftyJSON

class FireBaseDBmanager {
    func testPost(model: ProductModel) {
        let proModel = ["about": model.about,
                     "category": model.category,
                     "color": model.color,
                     "manufacture": model.manufacture,
                     "material": model.material,
                     "name": model.name,
                     "price": model.price,
                     "weigh": model.weigh,
                     "size": model.size
                     
      ] as [String : Any]
        
        Database.database().reference().child("categories").child(model.category).childByAutoId().setValue(proModel)
    }
    func getCategories() {
            let ref = Database.database().reference().child("basic_categories")
            
            ref.observe(DataEventType.value, with: { snapshot in
                for child in snapshot.children.allObjects as! [DataSnapshot]  {
                    
                    let categoryDictionary = child.value as? [String:Any]
                    let category = try? CategoryModel(dict: categoryDictionary!)
                }
            })
        }

        
        }//        ref.observe(DataEventType.value, with: { (snapshot) in
//                    if snapshot.childrenCount > 0 {
//                        guard let categoryObject = snapshot.children. as? [String: Any] else { return }
//                        let collectionFigures = categoryObject ["collection_figures"] as! String
//                        categories = CoinCategory(label: collectionFigures)
//                        for category in snapshot.children.allObjects as! [DataSnapshot] {
//
//
//                        }
//                    }
//                    print(categories)
//                }) { error in
//                    print(error.localizedDescription)
//                }
    


