//
//  CalorieList.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import UIKit
import Foundation

class CalorieList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //Properties
    //Declaring the Calorie Chart
    let calorieChart = Chart(frame: CGRect(x: 0, y: 62, width: 375, height: 200))
    let series = ChartSeries([0, 6.5, 2, 8, 4.1, 7, -3.1, 10, 8])
    
    //Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        self.view.addSubview(calorieChart)
        calorieChart.add(series)
    }
    
    
    
    //Add Calories Button
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Calorie Intake", message: "Enter the amount of Calories in the field", preferredStyle: .alert)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //Table View Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CalorieManager.shared.fakeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fatCell", for: indexPath)
        
        cell.textLabel?.text = CalorieManager.shared.fakeData[indexPath.row]
        
        return cell
    }
    
    //Fetch Results Controller Delegate Methods

    
    
}
