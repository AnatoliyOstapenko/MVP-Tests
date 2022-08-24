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
    init (view: InitialViewProtocol, manager: NetworkManagerProtocol)
    func getUsers()
}

class InitialPresenter: InitialViewPresenterProtocol {
    weak var view: InitialViewProtocol? // we can use any screens depends on protocol
    let manager: NetworkManagerProtocol
    var persistentManager = CoreDataManager.shared.context
    
    required init(view: InitialViewProtocol, manager: NetworkManagerProtocol) {
        self.view = view
        self.manager = manager
    }

    func getUsers() {
        manager.getUsers { [weak self] results in            
            guard let self = self else { return }
            switch results {
            case .success(let users):
                self.saveToDB(users: users) // save user to DB
                
                DispatchQueue.main.async {
                self.view?.setUsers(users: users) }
            case .failure(let error): print(error.localizedDescription)
                
            }
        }
    }
    
    func saveToDB(users: [Users]) {
        let usersToDB: [UserModel] = users.compactMap {
            let userDB = UserModel(context: self.persistentManager)
            userDB.user = $0.name
            userDB.username = $0.username
            return userDB
        }
        
        print(usersToDB)
    }
}

