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
    var manager: NetworkManagerProtocol!
    var presenter: InitialPresenter!
    var coordinator: Coordinator!

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
        manager = nil
        try super.tearDownWithError()
    }
    
    func test_getUsers() {
        
        // Arrange
        let geo = Geo(lat: "Foo", lng: "Bar")
        let address = Address(geo: geo)
        let user = Users(name: "Foo", username: "Bar", address: address)
        view = InitialVCMock()
        manager = NetworkManagerMock(users: [user])
        presenter = InitialPresenter(view: view, manager: manager)
        var fakeUsers: [Users] = []
        
        // Act
        manager.getUsers { result in
            switch result {
            case .success(let users): fakeUsers = users
            case .failure(let error): print(error)
            }
        }
        
        // Assert
        XCTAssertEqual(fakeUsers[0].name, "Foo")
    }

}

