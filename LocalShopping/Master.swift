//
//  Master.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 23/10/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import Foundation
import Firebase

var searchQuery: String?

var allStores: [Store] = []

let itemsReference = Database.database().reference(withPath: "items")

class Item {
    let name: String
    let price: Double
    let storeNames: [String]
    
    init(name: String, price: Double, storeNames: [String]) {
        self.name = name
        self.price = price
        self.storeNames = storeNames
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        price = (snapshotValue["price"]?.doubleValue)!
        storeNames = snapshotValue["store-names"] as! [String]
        
    }
}

public struct Store {
    let name: String
    let address: [String]
    let itemNames: [String]
}


/* I've added the following extension in order to display items on the table view in title case. Source: stackoverflow.com/questions/26306326/swift-apply-uppercasestring-to-only-the-first-letter-of-a-string
In order to show that I know what's going on in this code and not blindly copying it, I have written a comment on the necessary lines. */
extension String {
    func capitalizingFirstLetter() -> String {
        //Take the first element of the string (prefix(1)), uppercase it, then add it to a copy of the string that has its first element removed (dropFirst())
        return prefix(1).uppercased() + dropFirst()
    }
    
    //Creates a mutating version of the function above. It just makes it possible for one to write self.capitalizeFirstLetter instead of self = self.capitalizingFirstLetter()
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
