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
}

class InitialPresenter: InitialViewPresenterProtocol {
    
    weak var view: InitialViewProtocol?
    let manager: NetworkManagerProtocol
    let database: CoreDataManagerProtocol
    var databaseUsers: [Users] = []
    
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
//                self.filterArrays(databaseUsers: self.databaseUsers, gotUsers: users)
                self.database.saveUsersToDB(users: users)
                self.getUsersDatabase()
            case .failure(let error): print(error.localizedDescription)
            }
        }
    }
    
//    func filterArrays(databaseUsers: [Users], gotUsers: [Users]) {
//        let users = gotUsers.filter { databaseUsers.contains($0)}
//        
//        var array: [Users] = []
//        array.append(contentsOf: users)
//        database.saveUsersToDB(users: array)
//    }
    
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
}

