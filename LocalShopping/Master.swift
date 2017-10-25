//
//  Master.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 23/10/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import Foundation

var searchQuery: String?

var allItems: [Item] = []
var allStores: [Store] = []

public struct Item {
    let name: String
    let price: Double
    let storeNames: [String]
}

public struct Store {
    let name: String
    let address: [String]
    let itemNames: [String]
}
