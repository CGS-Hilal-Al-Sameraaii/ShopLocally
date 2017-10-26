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
    
    let itemsReference = Database.database().reference(withPath: "items")
    @IBOutlet var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
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
            var storeExists = false
            var userInput: [String] = []
            
            for i in addItem!.textFields! {
                userInput.append(i.text!)
            }
            
            for i in userInput {
                if i == "" {
                    self.userDidNotFillInFields(previousInputs: userInput)
                }
            }
            
            for store in allStores {
                if store.name == userInput[2] {
                    storeExists = true
                }
            }
            
            if !storeExists {
                self.addStore(storeName: userInput[2], containingItem: userInput[0])
            }
            
            if let priceInteger = Int(userInput[1]) {
                let priceNSNumber = NSNumber(value: priceInteger)
                
                let itemRef = self.itemsReference.child(userInput[0].lowercased())
                let values: [String: Any] = ["name": userInput[0].lowercased(), "price": priceNSNumber, "store-names": [userInput[2]]]
                itemRef.setValue(values)
            }
            
        }))
        present(addItem, animated: true)
    }
    
    func userDidNotFillInFields(previousInputs: [String]) {
        let userDidNotFillFields = UIAlertController(title: "Missing Fields", message: "You did not fill in all fields, please try again", preferredStyle: .alert)
        userDidNotFillFields.addAction(UIAlertAction(title: "OK", style: .cancel))
    }
    
    func addStore(storeName: String, containingItem: String) {
        let addStore = UIAlertController(title: "Add a Store", message: "", preferredStyle: .alert)
        
        addStore.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Store Name"
        }
        
        addStore.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Address"
        }
        
        addStore.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak addStore] (_) in
            var userInput: [String] = []
            
            for i in addStore!.textFields! {
                userInput.append(i.text!)
            }
            
            for i in userInput {
                if i == "" {
                    self.userDidNotFillInFields(previousInputs: userInput)
                }
            }
            
            allStores.append(Store(name: userInput[0], address: [userInput[1]], itemNames: [userInput[0]]))
            
        }))
        present(addStore, animated: true)
    }

}
