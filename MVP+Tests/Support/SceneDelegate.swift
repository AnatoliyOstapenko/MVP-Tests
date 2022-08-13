//
//  SceneDelegate.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navController: UINavigationController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        navController = UINavigationController(rootViewController: InitialBuilder.createVC())
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

