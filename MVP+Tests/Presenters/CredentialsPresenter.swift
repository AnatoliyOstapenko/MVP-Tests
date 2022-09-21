//
//  CredentialsPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 15.09.2022.
//

import Foundation
import UIKit

protocol CredentialViewProtocol: AnyObject {}

protocol CredentialPresenterProtocol: AnyObject {
    var view: CredentialViewProtocol? { get set }
    init(view: CredentialViewProtocol, validator: PasswordValidatorProtocol)
    func userVarification(login: UITextField, password: UITextField) -> Bool
}

class CredentialsPresenter: CredentialPresenterProtocol {
    weak var view: CredentialViewProtocol?
    var validator: PasswordValidatorProtocol
    
    required init(view: CredentialViewProtocol, validator: PasswordValidatorProtocol) {
        self.view = view
        self.validator = validator
    }
    
    func userVarification(login: UITextField, password: UITextField) -> Bool {
        validator.validatetextFields(loginTextField: login, passwordTextField: password)
    }
    
    
}




