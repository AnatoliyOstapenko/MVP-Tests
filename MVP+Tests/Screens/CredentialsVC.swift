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
    
    var presenter: CredentialPresenterProtocol?
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTextFields()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loginTextField.text = "Login"
        passwordTextField.text = "123"
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
            
            guard let presenter = presenter else { break }
            if presenter.userVarification(login: loginTextField, password: passwordTextField) {
                coordinator?.goToInitialScreen()
            } else {
                presentAlert(error: "Login or password incorrect, try again")
            }
            
        default: break
        }
        return true
    }
    
}
