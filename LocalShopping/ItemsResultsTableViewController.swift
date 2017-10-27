//
//  ItemsResultsTableViewController.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 13/10/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit
import Firebase

class ItemsResultsTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet var searchBar: UITextField!
    
    var allItems: [Item] = []
    var itemsInView: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshSearch()
        
        searchBar.text = searchQuery!
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Yeah")
        searchQuery = textField.text
        
        refreshSearch()
        
        return true
    }
    
    func refreshSearch() {
        itemsReference.observe(.value) { (snapshot) in
            
            for i in snapshot.children {
                let item = Item(snapshot: i as! DataSnapshot)
                self.allItems.append(item)
            }
            
            for i in self.self.allItems {
                if (i.name.lowercased().range(of: searchQuery!.lowercased()) != nil || searchQuery!.lowercased().range(of: i.name.lowercased()) != nil) {
                    self.itemsInView.append(i)
                }
            }
            
            self.tableView.reloadData()
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsInView.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        let item = itemsInView[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "$\(item.price) at \(item.storeName)"
        
        return cell
    }
    
    @IBAction func backButtonClicked(sender: UIButton) {
        searchQuery = ""
        performSegue(withIdentifier: "Back", sender: self)
    }

}
