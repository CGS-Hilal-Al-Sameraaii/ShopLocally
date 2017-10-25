//
//  FirstViewController.swift
//  LocalShopping
//
//  Created by Hilal Alsameraaii on 29/8/17.
//  Copyright © 2017 Hilal Al-Sameraaii. All rights reserved.
//

import UIKit

class StoresHomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        searchQuery = textField.text
        textField.resignFirstResponder()
        
        performSegue(withIdentifier: "StoresSearch", sender: self)
        
        return true
    }
    
}
