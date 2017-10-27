//
//  Master.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 23/10/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

//This file contains variables and constants that will be accessed by more than one class.

import Foundation
import Firebase

//searchQuery is where the user's search query is temporarily saved. It changes after every attempt
var searchQuery: String?

let itemsReference = Database.database().reference(withPath: "items")

//Class for creating item objects
class Item {
    let name: String
    let price: Double
    let storeName: String
    
    init(name: String, price: Double, storeName: String) {
        self.name = name
        self.price = price
        self.storeName = storeName
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        price = (snapshotValue["price"]?.doubleValue)!
        storeName = snapshotValue["store-name"] as! String
        
    }
}
