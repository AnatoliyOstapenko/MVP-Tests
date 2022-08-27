//
//  CoreDataManager.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 24.08.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    func saveUsersToDB(users: [Users])
    func saveUserToDB(user: UserModel) -> UserModel?
    func fetchUsersFromDB(completion: @escaping(Result<[UserModel], CustomError>) -> Void)
    func updateUsers(users: [UserModel])
    func deleteUser(user: UserModel)
    func deleteAllUsers()
}

class CoreDataManager: CoreDataManagerProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.entityName)
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Unable to load persistent stores: \(error)") }
        }
        return container
    }()
    
    func saveUsersToDB(users: [Users]) {
        let context = persistentContainer.viewContext
        
        let arr = users.compactMap {
//            let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
            let userDB = UserModel(context: context)
            userDB.user = $0.name
            userDB.username = $0.username
            userDB.latitude = $0.address.geo.lat.stringToDouble
            userDB.longitude = $0.address.geo.lng.stringToDouble
//            return userDB
            
        }
        print("Total users saving in CoreDataManager \(arr.count)")
        do { try context.save() }
        catch { print("Failed to save users to Database") }

    }
    
    func fetchUsersFromDB(completion: @escaping(Result<[UserModel], CustomError>) -> Void) {
        let context = persistentContainer.viewContext

        do {
            let users = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            print("Total users in CoreDataManager \(users.count)")
            completion(.success(users))
        } catch {  completion(.failure(.failFetchFromDatabase)) }
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
    
    func updateUsers(users: [UserModel]) {
        let context = persistentContainer.viewContext
        do { try context.save() }
        catch { print("Failed to update data from Database") }
        
    }
    
    func deleteAllUsers() {
        print("deleteAllUsers in CoreData triggered")
        let context = persistentContainer.viewContext
        do {
            let users = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            for user in users {
                context.delete(user)
            }
            try context.save()
        } catch { print("oops")}
    }
    func deleteUser(user: UserModel) {
        let context = persistentContainer.viewContext
        context.delete(user)
    }
}
