//
//  ViewController.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.addSubview(calorieChart)
        calorieChart.add(series)
    }
    
    let calorieChart = Chart(frame: CGRect(x: 0, y: 62, width: 375, height: 205))
    let series = ChartSeries([0, 6.5, 2, 8, 4.1, 7, -3.1, 10, 8])

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Calorie Intake", message: "Enter the amount of Calories in the field", preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil)
    }

}

