//
//  InitialBuilder.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 13.08.2022.
//

import Foundation
import UIKit

protocol InitialBuilderProtocol {
    static func createVC() -> UIViewController
}

class InitialBuilder: InitialBuilderProtocol {
    static func createVC() -> UIViewController {
        let view = InitialVC()
        let manager = NetworkManager()
        let presenter = InitialPresenter(view: view, manager: manager)
        
        view.presenter = presenter
        return view
    }
}
