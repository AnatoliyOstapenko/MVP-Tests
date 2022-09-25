//
//  InitialPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation
import UIKit

protocol InitialViewProtocol: AnyObject {
    func setUsers(users: [Users])
}

protocol InitialViewPresenterProtocol: AnyObject {
    init (view: InitialViewProtocol, manager: NetworkManagerProtocol, database: CoreDataManagerProtocol)
    func getUsersNetworking()
    func getUsersDatabase()
    func deleteAllUsers(users: [Users])
    func saveNewUser(user: Users)
    func deleteUser(user: Users)
}

class InitialPresenter: InitialViewPresenterProtocol {
    
    weak var view: InitialViewProtocol?
    private let manager: NetworkManagerProtocol
    private let database: CoreDataManagerProtocol
    var databaseUsers: [Users] = []
    var error: CustomError?
    
    required init(view: InitialViewProtocol, manager: NetworkManagerProtocol, database: CoreDataManagerProtocol) {
        self.view = view
        self.manager = manager
        self.database = database
    }
    
    // Get users from URL and save them in Database
    
    func getUsersNetworking() {
        self.getUsersDatabase()
        manager.getUsers { [weak self] results in
            guard let self = self else { return }
            switch results {
            case .success(let users):
                self.saveNewUsers(databaseUsers: self.databaseUsers, gotUsers: users)
                self.getUsersDatabase()
                self.databaseUsers.append(contentsOf: users)
            case .failure(let error): self.error = error
            }
        }
    }
    
    func saveNewUsers(databaseUsers: [Users], gotUsers: [Users]) {
        guard !databaseUsers.isEmpty else {
            database.saveUsersToDB(users: gotUsers)
            return
        }
        let newUsers = gotUsers.filter { !databaseUsers.contains($0)}
        self.databaseUsers.append(contentsOf: newUsers) // TODO: - Delete that if app crashes
        database.saveUsersToDB(users: newUsers)
    }
    
    // Get users from Database and send them to InitialVC
    
    func getUsersDatabase() {
        database.fetchUsersFromDB { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.databaseUsers = users
                DispatchQueue.main.async {
                    self.view?.setUsers(users: users)
                }
            case .failure(let error): print(error.rawValue)
            }
        }
    }
    
    func deleteAllUsers(users: [Users]) {
        let remainingUsers = users.filter{!databaseUsers.contains($0)}
        databaseUsers = remainingUsers
        database.deleteAllUsers(users: users)
    }
    
    func saveNewUser(user: Users) {
        databaseUsers.append(user)
        database.saveUserToDB(user: user)
    }
    
    func deleteUser(user: Users) {
        let remainingUsers = databaseUsers.filter{!$0.name.contains(user.name)}
        databaseUsers = remainingUsers
        database.deleteUser(user: user)
        
    }
}


