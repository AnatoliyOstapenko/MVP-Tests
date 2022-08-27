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
    func saveUserToDB(user: Users)
    func fetchUsersFromDB(completion: @escaping(Result<[UserModel], CustomError>) -> Void)
    func deleteUser(user: Users)
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
        
        
        _ = users.compactMap {
            let userDB = UserModel(context: context)
            userDB.user = $0.name
            userDB.username = $0.username
            userDB.latitude = $0.address.geo.lat.stringToDouble
            userDB.longitude = $0.address.geo.lng.stringToDouble
        }
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
    
    func saveUserToDB(user: Users) {
        let context = persistentContainer.viewContext
        let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
        userDB.user = user.name
        userDB.username = user.username
        userDB.latitude = user.address.geo.lat.stringToDouble
        userDB.longitude = user.address.geo.lng.stringToDouble
        
        do { try context.save() }
        catch { print("Failed to save user to Database") }
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
    
    func deleteUser(user: Users) {
        let context = persistentContainer.viewContext
        var convertedUser: UserModel {
            let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
            userDB.user = user.name
            userDB.username = user.username
            userDB.latitude = user.address.geo.lat.stringToDouble
            userDB.longitude = user.address.geo.lng.stringToDouble
            return userDB
        }
        context.delete(convertedUser)
    }
}
