//
//  PasswordValidator.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 16.09.2022.
//

import Foundation
import UIKit

protocol PasswordValidatorProtocol {
    func validatetextFields(loginTextField: UITextField, passwordTextField: UITextField) -> Bool
}

class PasswordValidator: PasswordValidatorProtocol {

    func validatetextFields(loginTextField: UITextField, passwordTextField: UITextField) -> Bool {
        return loginTextField.hasText &&
               passwordTextField.hasText &&
               passwordTextField.text == "123"
    }
}

extension FloatingPoint {
    var isInteger: Bool {rounded() == self}
}

extension Sequence where Element == Int {
    var sum: Int { reduce(0,+) }
}
