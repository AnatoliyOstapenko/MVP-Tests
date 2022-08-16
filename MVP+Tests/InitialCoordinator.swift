//
//  InitialCoordinator.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 16.08.2022.
//

import Foundation
import UIKit

protocol InitialCoordinatorProtocol {
    var navController: UINavigationController { get set }
    func start()
}

class InitialCoordinator: InitialCoordinatorProtocol {
    var navController: UINavigationController
    init(navController: UINavigationController) {self.navController = navController }
    
    func start() {}
}
