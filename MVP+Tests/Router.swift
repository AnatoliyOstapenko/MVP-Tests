//
//  Router.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 17.08.2022.
//

import Foundation
import UIKit

// MARK: - AssemblyBuilder

protocol AssemblyBuilderProtocol: AnyObject {
    func createInitialVC() -> UIViewController
    func createMapScreenVC(user: Users) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    
    func createInitialVC() -> UIViewController {
        let view = InitialVC()
        let manager = NetworkManager()
        let presenter = InitialPresenter(view: view, manager: manager)
        
        view.presenter = presenter
        return view
    }
    
    func createMapScreenVC(user: Users) -> UIViewController {
        let view = MapScreenVC()
        let presenter = MapScreenPresenter(view: view, user: user)
        
        view.presenter = presenter
        return view
    }
    
    
}

// MARK: - Router

protocol RouterMain {
    var navController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialVC()
    func mapScreenVC(user: Users)
    func popToRoot()    
}

class Router: RouterProtocol {
    var navController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navController = navController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialVC() {
        if let navController = navController {
            guard let vc = assemblyBuilder?.createInitialVC() else { return }
            navController.viewControllers = [vc]
        }
    }
    
    func mapScreenVC(user: Users) {
        if let navController = navController {
            guard let vc = assemblyBuilder?.createMapScreenVC(user: user) else {return}
            navController.viewControllers = [vc]
        }
    }
    
    func popToRoot() {
        if let navController = navController {
            navController.popToRootViewController(animated: true)
        }
    }
    
    
    
    
}

