//
//  ViewController.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "abc", message: "def", preferredStyle: .alert)
        
        
        self.present(alert, animated: true, completion: nil)
    }

}

