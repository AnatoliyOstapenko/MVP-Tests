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
    
    override func setUpWithError() throws { sut = PasswordValidator() }
    override func tearDownWithError() throws { sut = nil }

    func test_validatetextFields() {
        // Arrange
        let loginTextField = UITextField()
        let passwordTextField = UITextField()
        loginTextField.text = "Foo"
        passwordTextField.text = "123"

        // Act
        let result = sut.validatetextFields(loginTextField: loginTextField, passwordTextField: passwordTextField)
        // Assert
        XCTAssertEqual(result, true)
    }
    
    func test_isInteger() {
        // Arrange
        let num: Float = 12.0000000
        // Act
        let result = num.isInteger
        // Assert
        XCTAssertEqual(result, true)
    }
    
    func test_fake() {
        let odds = stride(from: 1, to: 9, by: 2)
    }

}
