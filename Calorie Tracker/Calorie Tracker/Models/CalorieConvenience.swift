//
//  CalorieConvenience.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import Foundation
import CoreData
extension Calorie { //Extending the Calorie entity in the data model.
    
    convenience init(
        amount: Double,
        date: Date,
        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context) //Setting context to my coredata main context
        self.amount = amount //Attribute from the Calorie Entity
        self.date = date //Attribute from the Calorie Entity
    }
}
