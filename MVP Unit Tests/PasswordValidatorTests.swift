//
//  PasswordValidatorTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 16.09.2022.
//

import XCTest
@testable import MVP_Tests

final class PasswordValidatorTests: XCTestCase {
    
    var sut: PasswordValidatorProtocol!

    override func setUpWithError() throws {
        sut = PasswordValidator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_validatetextFields() {
        // Arrange
        var loginTextField = UITextField()
        var passwordTextField = UITextField()
        var login = "Foo"
        var password = "123"
        var result: Bool?
        // Act
        loginTextField.text = login
        passwordTextField.text = password
        result = sut.validatetextFields(loginTextField: loginTextField, passwordTextField: passwordTextField)
        // Assert
        //password is correct
        XCTAssertEqual(result, true)
    }

}
