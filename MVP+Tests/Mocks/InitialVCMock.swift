//
//  InitialVCMock.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import Foundation

class InitialVCMock: InitialViewProtocol {
    
    var users: [Users]?
    func setUsers(users: [Users]) {
        self.users = users
    }
    
    
}
