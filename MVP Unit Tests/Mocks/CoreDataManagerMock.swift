//
//  CoreDataManagerMock.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 22.09.2022.
//

import Foundation
@testable import MVP_Tests

class CoreDataManagerMock: CoreDataManagerProtocol {
    
    var _saveUsersToDB: [Users]?
    var _saveUserToDB: Users?
    var _fetchUsersFromDB: Result<[Users], CustomError>?
    var _deleteUser: Users?
    
    func saveUsersToDB(users: [Users]) {}
    func saveUserToDB(user: Users) {}
    func deleteUser(user: Users) {}
    func deleteAllUsers(users: [Users]) {}

    func fetchUsersFromDB(completion: @escaping (Result<[Users], CustomError>) -> Void) {
        if let result = _fetchUsersFromDB { completion(result) }
    }
}
