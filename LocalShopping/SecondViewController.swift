//
//  FirstViewController.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 29/8/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchBar: UITextField!
    var searchQuery: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchQuery = textField.text
        textField.resignFirstResponder()
        
        performSegue(withIdentifier: "StoresSearch", sender: self)
        
        return true
    }
    
}

class StoresResults: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var stores = ["localstore", "bigstore", "littlestore"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(stores.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = stores[indexPath.row]
        
        return(cell)
    }
    
    
    
}
