//
//  InitialPresenterTests.swift
//  MVP+TestsTests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import XCTest
@testable import MVP_Tests

class InitialPresenterTests: XCTestCase {
    
    var view: InitialVCMock!
    var manager: NetworkManager!
    var presenter: InitialPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = InitialVCMock()
        manager = NetworkManager()
        presenter = InitialPresenter(view: view, manager: manager)
    }

    override func tearDownWithError() throws {
        manager = nil
        view = nil
        presenter = nil
        try super.tearDownWithError()
    }
    
    func test_initPresenterNotNil() {
        // Assert
        XCTAssertNotNil(presenter)
    }
    
    func test_getUsers() {
        // Arrange
        let users: [Users] = [Users(name: "Foo", username: "Bar")]
        // Act
        presenter.getUsers()
        manager.getUsers { result in
            switch result {
            case .success(let users): self.view.setUsers(users: users)
            case .failure(let error): print(error)
            }
        }
        // Assert
        XCTAssertEqual(view.users, nil)
    }
}

