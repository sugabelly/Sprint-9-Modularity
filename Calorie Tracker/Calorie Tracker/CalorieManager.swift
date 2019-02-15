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
    
    //Core Data CRUD
    
    //Create a new Calorie entry
    func newEntry(amount: Double, date: Date, sendtoFB: Bool = true, savetoCD: Bool = true, moc: NSManagedObjectContext = CoreDataStack.shared.mainContext)
    {
        moc.perform {
            let entry = Calorie(amount: amount, date: date)
            if sendtoFB {
                FirebaseController().sendMovie(movie: newEntry)
            }
            if savetoCD {
                do {
                    try moc.save()
                } catch { NSLog("Failed to save while creating a new movie") }
            }
        }
    }

    
    //Match data to Calorie Representation
    func matchToRep(entryRep: CalorieRep, moc: NSManagedObjectContext) throws
    {
        moc.perform {

            let entry: Calorie? = Calorie(amount: entryRep.amount, date: entryRep.date, context: moc)
            }
        }
    
    }
    
    
    //Delete Calorie Entry
    func deleteEntry(entry: Calorie, index: IndexPath, _ completion:@escaping Completions = Empties)
    {
        let stub = entry.getEntry() //Get a reference of the entry on Firebase
        
        guard let moc = entry.managedObjectContext else { return }
        
        moc.performAndWait {
            moc.delete(entry) //Delete the entry
            
            do {
                try moc.save() //Save the change
                
            } catch {
                
                showErrors(completion, "Unable to save moc")
                return
            }
        }
        
        let deleteRequest = FirebaseManager.shared.buildURLRequest([stub.id.uuidString], "DELETE")
        
        URLSession.shared.dataTask(with: deleteRequest) { (_, _, error) in
            if let error = error {
                showErrors(completion, "Error deleting: \(error)")
                return
            }
            
            completion(nil)
            
            }.resume()
    }
    
    //Report Errors
    func showErrors(_ completion: @escaping Completions, _ error: String)
    {
        NSLog(error)
        completion(error)
    }

//Type Alias for pretty completion handling
typealias Completions = (String?) -> Void
let Empties: Completions = {_ in}

        
