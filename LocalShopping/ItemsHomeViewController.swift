//
//  FirstViewController.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 29/8/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit
import Firebase

class ItemsHomeViewController: UIViewController, UITextFieldDelegate {
    
    //Declaring the search bar on the home screen as a variable
    @IBOutlet var searchBar: UITextField!
    
    //The following code executes if the user presses return on the text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchQuery = textField.text
        performSegue(withIdentifier: "Search", sender: self)
        
        return true
    }
    
    @IBAction func addItem(sender: UIButton) {
        let addItem = UIAlertController(title: "Add an Item", message: "", preferredStyle: .alert)
        
        addItem.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Item Name"
        }
        
        addItem.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Item Price"
        }
        
        addItem.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Store Name"
        }
        
        addItem.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak addItem] (_) in
            var userInput: [String] = []
            
            for i in addItem!.textFields! {
                userInput.append(i.text!)
            }
            
            if let priceInteger = Int(userInput[1]) {
                let priceNSNumber = NSNumber(value: priceInteger)
                
                let itemRef = itemsReference.child(userInput[0].lowercased())
                let values: [String: Any] = ["name": userInput[0], "price": priceNSNumber, "store-name": userInput[2]]
                itemRef.setValue(values)
            }
            
        }))
        present(addItem, animated: true)
    }

}
