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
    func goToInitialScreen()
//    func goToTermsAndConditionsScreen(vc: UIViewController, textMessage: String)
    func showAlertOrTConditionVC(vc: UIViewController, textMessage: String)
}

// InitialVC
class Coordinator: CoordinatorProtocol {
    var navController: UINavigationController
    init(navController: UINavigationController) {self.navController = navController }

    func start() {
        let view = CredentialsVC()
        let validator = PasswordValidator()
        let presenter = CredentialsPresenter(view: view, validator: validator)

        view.presenter = presenter
        view.coordinator = self
        navController.pushViewController(view, animated: true)
    }
    
    func goToInitialScreen() {
        let view = InitialVC()
        let manager = NetworkManager()
        let database = CoreDataManager()
        let presenter = InitialPresenter(view: view, manager: manager, database: database)
        
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
    
    func showAlertOrTConditionVC(vc: UIViewController, textMessage: String) {

        var view: MessageProtocol!
        view = vc is CredentialsVC ? TermsAndConditionsVC(text: textMessage) : AlertVC(errorText: textMessage)

        view.coordinator = self
        view.modalPresentationStyle = .overFullScreen
        view.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async {vc.present(view, animated: true)}
    }
}
