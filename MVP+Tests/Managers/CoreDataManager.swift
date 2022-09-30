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
    func deleteAllUsers(users: [Users])
}

class CoreDataManager: CoreDataManagerProtocol {
    
    var users: [UserModel] = []
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constants.entityName)
        container.loadPersistentStores { description, error in
            if let error = error { fatalError("Unable to load persistent stores: \(error)") }
        }
        return container
    }()
    
    func saveUsersToDB(users: [Users]) {
        let context = persistentContainer.viewContext

        self.users = users.compactMap {
            let userDB = UserModel(context: context)
            userDB.user = $0.name
            userDB.username = $0.username
            userDB.latitude = $0.address.geo.lat.stringToDouble
            userDB.longitude = $0.address.geo.lng.stringToDouble
            return userDB
        }
        do { try context.save() }
        catch { print("Failed to save users to Database") }
    }
    
    func fetchUsersFromDB(completion: @escaping(Result<[Users], CustomError>) -> Void) {
        let context = persistentContainer.viewContext

        do {
            let users = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            completion(.success(users.compactMap { Users(name: $0.user ?? "", username: $0.username ?? "", address: Address(geo: Geo(lat: $0.latitude.doubleToString, lng: $0.longitude.doubleToString)))}))
            
        } catch {  completion(.failure(.failFetchFromDatabase)) }
    }
    
    func saveUserToDB(user: Users) {
        let context = persistentContainer.viewContext
        let userDB = NSEntityDescription.insertNewObject(forEntityName: Constants.entityName, into: context) as! UserModel
        userDB.user = user.name
        userDB.username = user.username
        userDB.latitude = user.address.geo.lat.stringToDouble
        userDB.longitude = user.address.geo.lng.stringToDouble
        self.users.append(userDB)
        
        do { try context.save() }
        catch { print("Failed to save user to Database") }
    }
    
    func deleteAllUsers(users: [Users]) {
        let context = persistentContainer.viewContext
        self.users.removeAll()

        do {
            let usersDB = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))
            usersDB.forEach { userDB in
                users.forEach { user in
                    if userDB.user == user.name {
                        context.delete(userDB)
                    }
                }
            }
            try context.save()
        } catch { print("Delete all users fails") }
    }
    
    func deleteUser(user: Users) {
        let context = persistentContainer.viewContext
        do {
            let usersDB = try context.fetch(NSFetchRequest<UserModel>(entityName: Constants.entityName))

            for userOne in usersDB {
                if user.name == userOne.user {
                    context.delete(userOne)
                    let filteredUsers = users.filter {$0.user != user.name}
                    self.users = filteredUsers
                }
            }
            try context.save()
        } catch { print("Delete one user fails")}
    }
}
