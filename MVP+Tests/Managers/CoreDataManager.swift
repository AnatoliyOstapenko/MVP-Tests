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
    func fetchUsersFromDB(completion: @escaping(Result<[Users], CustomError>) -> Void)
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
    
    func fetchUsersFromDB(completion: @escaping(Result<[Users], CustomError>) -> Void) {
        let context = persistentContainer.viewContext

        do {
            let users = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            let convertedUsers: [Users] = users.compactMap {
                let user: Users = Users(name: $0.user ?? "",
                                        username: $0.username ?? "",
                                        address: Address(geo: Geo(lat: $0.latitude.doubleToString,
                                                                  lng: $0.longitude.doubleToString)))
                return user
            }
            completion(.success(convertedUsers))
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
