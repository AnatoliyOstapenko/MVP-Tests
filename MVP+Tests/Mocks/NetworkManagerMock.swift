//
//  NetworkManagerMock.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 20.08.2022.
//

import Foundation

class NetworkManagerMock: NetworkManagerProtocol {
    
    var users: [Users]!

    init() {}
    convenience init(users: [Users]) {
        self.init()
        self.users = users
        
    }
    
    func getUsers(completion: @escaping (Result<[Users], Error>) -> Void) {
        if !users.isEmpty {
            completion(.success(users))
        } else {
            let error = NSError(domain: "there is no users", code: 0, userInfo: nil)
            completion(.failure(error))
        }
        
    }
    

}
