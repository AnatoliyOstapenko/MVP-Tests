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
    
    func test_fake1() {
        let numbers = stride(from: 3, to: 0, by: -1)
        XCTAssertEqual(numbers.sum, 6)
    }
    
    func test_fake2() {
        let numbers = [1.1, 1.5, 1.4]
        XCTAssertEqual(numbers.sum, 4)
    }

}


extension Sequence where Element: AdditiveArithmetic {
    var sum: Element { reduce(.zero, +) }
}
