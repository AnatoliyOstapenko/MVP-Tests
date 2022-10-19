//
//  UIViewController+Ext.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import Foundation
import UIKit

extension UIViewController {
    func presentAlert(error: String) {
        let alertVC = AlertVC(errorText: error)
        alertVC.modalPresentationStyle = .overFullScreen
        alertVC.modalTransitionStyle = .crossDissolve
        DispatchQueue.main.async { self.present(alertVC, animated: true) }
    }
}
