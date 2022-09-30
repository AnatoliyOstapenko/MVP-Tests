//
//  CredentialsPresenterTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 18.09.2022.
//

import XCTest
@testable import MVP_Tests

final class CredentialsPresenterTests: XCTestCase {
    
    var validator: PasswordValidatorProtocol!
    var view: CredentialViewProtocol!
    var presenter: CredentialPresenterProtocol!

    override func setUpWithError() throws {
        validator = PasswordValidator()
        view = CredentialsVC()
        presenter = CredentialsPresenter(view: view, validator: validator)
        
    }

    override func tearDownWithError() throws {
        presenter = nil
        view = nil
        validator = nil
    }
    
    func test_userVarification() {
        // Arrange
        let loginTF = UITextField()
        let passwordTF = UITextField()
        loginTF.text = "Bar"
        passwordTF.text = "123"
        // Act
        let result = presenter.userVarification(login: loginTF, password: passwordTF)
        // Assert
        XCTAssertEqual(result, true)
    }    
}
