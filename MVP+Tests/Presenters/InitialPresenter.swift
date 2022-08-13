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
    init (view: InitialViewProtocol)
    func getUsers()
}

typealias PresenterDelegate = InitialViewProtocol & UIViewController

class InitialPresenter: InitialViewPresenterProtocol {
    weak var view: InitialViewProtocol? // we can use any screens depends on protocol
    let manager = NetworkManager()
    
    required init(view: InitialViewProtocol) {
        self.view = view
    }

    func getUsers() {
        manager.getUsers { [weak self] results in
            guard let self = self else { return }
            switch results {
            case .success(let users):
                DispatchQueue.main.async { self.view?.setUsers(users: users) }
            case .failure(let error): print(error.localizedDescription)
                
            }
        }
    }
}

