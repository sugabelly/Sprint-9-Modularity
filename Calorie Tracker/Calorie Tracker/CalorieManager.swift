//
//  CalorieChart.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import UIKit
import CoreData

class CalorieManager {
    
    static let shared = CalorieManager()
    
    var fakeData = ["hello", "testing", "wow"]
    
    var calories: [Calorie] {
        
        let fetchRequest: NSFetchRequest<Calorie> = Calorie.fetchRequest()
        
        //Return an array of Calories or an empty array if it fails
        let results = (try? CoreDataStack.shared.mainContext.fetch(fetchRequest)) ?? []
        
        return results //This will be what enters calories array.
    }
        
}
