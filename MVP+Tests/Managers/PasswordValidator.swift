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
    func asyncValidateTextFields(loginTextField: UITextField, passwordTextField: UITextField, complition: @escaping(Bool) -> Void)
}

class PasswordValidator: PasswordValidatorProtocol {

    func validatetextFields(loginTextField: UITextField, passwordTextField: UITextField) -> Bool {
        return loginTextField.hasText &&
               passwordTextField.hasText &&
               passwordTextField.text == "123"
    }
    
    func asyncValidateTextFields(loginTextField: UITextField, passwordTextField: UITextField, complition: @escaping(Bool) -> Void) {
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1.5, execute: {
            DispatchQueue.main.async {
                let result = loginTextField.hasText && passwordTextField.hasText && passwordTextField.text == "123"
                complition(result)
            }   
        })
    }
    
    
}

extension FloatingPoint {
    var isInteger: Bool {rounded() == self}
}

extension Sequence where Element == Int {
    var sum: Int { reduce(0,+) }
}
