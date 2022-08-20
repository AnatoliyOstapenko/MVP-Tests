//
//  Coordinator.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 16.08.2022.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navController: UINavigationController { get set }
    func start()
    func createMapScreen(user: Users)
}

// InitialVC
class Coordinator: CoordinatorProtocol {
    var navController: UINavigationController
    init(navController: UINavigationController) {self.navController = navController }
    
    func start() {
        let view = InitialVC()
        let manager = NetworkManager()
        let presenter = InitialPresenter(view: view, manager: manager)
        
        view.presenter = presenter
        view.coordinator = self
        navController.pushViewController(view, animated: true)
    }
    
    func createMapScreen(user: Users) {
        let view = MapScreenVC()
        let presenter = MapScreenPresenter(view: view, user: user)
        
        view.presenter = presenter
        view.coordinator = self
        navController.pushViewController(view, animated: true)
    }
}
