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
    
    func test_asyncValidateTextFields() {
        // Arrange
        let loginTextField = UITextField()
        let passwordTextField = UITextField()
        loginTextField.text = "Foo"
        passwordTextField.text = "123"
        var result: Bool?
        let expectation = expectation(description: #function)
        
        // Act
        sut.asyncValidateTextFields(loginTextField: loginTextField, passwordTextField: passwordTextField) { isValid in
            result = isValid
            expectation.fulfill()
        }
        // Assert
        waitForExpectations(timeout: 20) { error in
            guard error == nil else { return }
            XCTAssertEqual(result, true)
        }
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
