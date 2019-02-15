//
//  CoreDataStack.swift
//  Calorie Tracker
//
//  Created by Lotanna Igwe-Odunze on 2/15/19.
//  Copyright © 2019 Sugabelly LLC. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    let container: NSPersistentContainer
    let mainContext: NSManagedObjectContext
    
    private init() {
        
        container = NSPersistentContainer(name: "Calories")
        container.loadPersistentStores { (description, error) in
            if let cdLoadError = error { fatalError("Couldn't load from Core Data container: \(cdLoadError)") }
        } //End of container
        
        mainContext = container.viewContext

    } // End of Init
    
}//End of CoreDataStack
