//
//  ItemsResultsTableViewController.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 13/10/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit

class ItemsResultsTableViewController: UITableViewController {

    @IBOutlet var searchBar: UISearchBar!
    
    var itemsInView: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.text = searchQuery!
        
        for i in allItems {
            if (i.name.lowercased().range(of: searchQuery!.lowercased()) != nil || searchQuery!.lowercased().range(of: i.name.lowercased()) != nil) {
                itemsInView.append(i)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemsInView.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        // Configure the cell...

        let item = itemsInView[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = String(item.price)
        
        return cell
    }
    
    @IBAction func selectedItem() {
        
    }

}
