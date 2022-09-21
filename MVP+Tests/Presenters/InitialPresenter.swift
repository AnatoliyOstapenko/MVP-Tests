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
    func deleteAllUsers()
    func saveNewUser(user: Users)
    func deleteUser(user: Users)
}

class InitialPresenter: InitialViewPresenterProtocol {
    
    weak var view: InitialViewProtocol?
    private let manager: NetworkManagerProtocol
    private let database: CoreDataManagerProtocol
    var databaseUsers: [Users] = []
    var users: [Users] = []
    
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
                self.users.append(contentsOf: users)
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
    func saveNewUsers(databaseUsers: [Users], gotUsers: [Users]) {
        guard !databaseUsers.isEmpty else {
            database.saveUsersToDB(users: gotUsers)
            return
        }
        let newUsers = gotUsers.filter { !databaseUsers.contains($0)}
        database.saveUsersToDB(users: newUsers)
    }
    
    // Get users from Database and send them to InitialVC
    
    func getUsersDatabase() {
        database.fetchUsersFromDB { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                let convertUsersFromDBToModel: [Users] = users.compactMap {
                    let user: Users = Users(name: $0.user ?? "", username: $0.username ?? "", address: Address.init(geo: Geo.init(lat: $0.latitude.doubleToString, lng: $0.longitude.doubleToString)))
                    return user
                }
                self.databaseUsers = convertUsersFromDBToModel
                print("Total user from DB \(convertUsersFromDBToModel.count)")
                DispatchQueue.main.async {
                    self.view?.setUsers(users: convertUsersFromDBToModel)
                }
            case .failure(let error): print(error.rawValue)
            }
        }
    }
    
    func deleteAllUsers() { database.deleteAllUsers() }
    func saveNewUser(user: Users) { database.saveUserToDB(user: user) }
    func deleteUser(user: Users) {database.deleteUser(user: user)}
}


