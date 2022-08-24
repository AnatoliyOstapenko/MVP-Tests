//
//  CoreDataManager.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 24.08.2022.
//

import Foundation
import CoreData


class CoreDataManager {
    
    static let shared = CoreDataManager()
    var context: NSManagedObjectContext { return persistentContainer.viewContext }
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.container)
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Unable to load persistent stores: \(error)") }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do { try context.save() }
        catch let error as NSError { print("Error: \(error), \(error.userInfo)") }
    }
    
    
}
