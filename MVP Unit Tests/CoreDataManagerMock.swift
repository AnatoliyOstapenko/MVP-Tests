//
//  CoreDataManagerMock.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 22.09.2022.
//

import Foundation
@testable import MVP_Tests

class CoreDataManagerMock: CoreDataManagerProtocol {
    
    var _saveUsersToDB: [MVP_Tests.Users]?
    var _saveUserToDB: MVP_Tests.Users?
    var _fetchUsersFromDB: Result<[Users], CustomError>?
    var _deleteUser: MVP_Tests.Users?
    
    func saveUsersToDB(users: [MVP_Tests.Users]) {
        
    }
    
    func saveUserToDB(user: MVP_Tests.Users) {
        
    }
    
    func fetchUsersFromDB(completion: @escaping (Result<[Users], CustomError>) -> Void) {
        if let result = _fetchUsersFromDB { completion(result) }
    }
    
    func deleteUser(user: MVP_Tests.Users) {
        
    }
    
    func deleteAllUsers() {
        
    }
    
    
}
