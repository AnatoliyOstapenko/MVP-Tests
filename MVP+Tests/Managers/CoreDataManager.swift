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
        let container = NSPersistentContainer(name: Constants.entityName)
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Unable to load persistent stores: \(error)") }
        }
        return container
    }()
    
    @discardableResult
    func saveUsersToDB(users: [Users]) -> [UserModel]? {
        let context = persistentContainer.viewContext
        
        let usersToDB: [UserModel] = users.compactMap {
//            let userDB = UserModel(context: persistentContainer.viewContext)
            let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
            
            userDB.user = $0.name
            userDB.username = $0.username
            userDB.latitude = $0.address.geo.lat.stringToDouble
            userDB.longitude = $0.address.geo.lng.stringToDouble
            return userDB
        }
        
        do {
            try context.save()
            return usersToDB
        } catch { print("Failed to save users to Database") }
        
        return nil
    }
    
    func saveUserToDB(user: UserModel) -> UserModel? {
        let context = persistentContainer.viewContext
        let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
        do {
            try context.save()
            return userDB
        } catch { print("Failed to save user to Database") }
        
        return nil
    }
    
    func fetchUsersFromDB() -> [UserModel]? {
        let context = persistentContainer.viewContext

        do {
            let users = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            return users
        } catch {  print("Failed to fetch data from Database") }
           
        return nil
    }
    
    func updateUsers(users: [UserModel]) {
        let context = persistentContainer.viewContext
        do { try context.save() }
        catch { print("Failed to update data from Database") }
        
    }
    
    func deleteUsers(user: UserModel) {
        let context = persistentContainer.viewContext
        context.delete(user)
    }
   
//    func saveContext() {
//        let context = persistentContainer.viewContext
//        guard context.hasChanges else { return }
//        do { try context.save() }
//        catch let error as NSError { print("Error: \(error), \(error.userInfo)") }
//    }
//
    
}
