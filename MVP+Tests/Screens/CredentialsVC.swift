//
//  CredentialsVCViewController.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 15.09.2022.
//

import UIKit

class CredentialsVC: UIViewController {
    
    private let credentialsStackView = UIStackView()
    private let loginTextField = CustomTextField()
    private let passwordTextField = CustomTextField()
    
    weak var presenter: CredentialPresenterProtocol?
    var coordinator: CoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextFields()
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        credentialsStackView.setCredentialsStackView(view: view, stack: credentialsStackView, login: loginTextField, password: passwordTextField)
    }
    
    private func configureTextFields() {
        loginTextField.returnKeyType = .continue
        loginTextField.enablesReturnKeyAutomatically = true
        passwordTextField.returnKeyType = .done
        passwordTextField.enablesReturnKeyAutomatically = true
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
    }
}

// MARK: - Extensions

extension CredentialsVC: CredentialViewProtocol {}

extension CredentialsVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case loginTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
            coordinator?.goToInitialScreen()
        default: break
        }
        return true
    }

}
