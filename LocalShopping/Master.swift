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

//Creating the reference to the "items" path in Firebase
let itemsReference = Database.database().reference(withPath: "items")

//Class for creating item objects
class Item {
    //name of the item
    let name: String
    //price of the item
    let price: Double
    //name of the store at which the item is available
    let storeName: String
    
    //I have not yet used this init
    init(name: String, price: Double, storeName: String) {
        self.name = name
        self.price = price
        self.storeName = storeName
    }
    
    //This creates an item based on a DataSnapshot data type. I've used this to convert data from Firebase into Item objects.
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        price = (snapshotValue["price"]?.doubleValue)!
        storeName = snapshotValue["store-name"] as! String
        
    }
}
