//
//  NetworkManagerMock.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 19.09.2022.
//

import UIKit
@testable import MVP_Tests

class NetworkManagerMock: NetworkManagerProtocol {
    
    var stubedResult: Result<[MVP_Tests.Users], Error>?
    
    func getUsers(completion: @escaping (Result<[MVP_Tests.Users], Error>) -> Void) {
        if let result = stubedResult { completion(result) }
    }
}
