//
//  InitialPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation

protocol InitialViewProtocol: AnyObject {
    func testMethod()
}

protocol InitialViewPresenterProtocol: AnyObject {
    init (view: InitialViewProtocol, users: [Users])
    func getUsers()
}

class InitialPresenter: InitialViewPresenterProtocol {
    let view: InitialViewProtocol // we can use any screens depends on protocol
    let users: [Users]
    
    required init(view: InitialViewProtocol, users: [Users]) {
        self.view = view
        self.users = users
    }

    func getUsers() {
        
    }
}
