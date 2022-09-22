//
//  InitialPresenterTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 18.09.2022.
//

import XCTest
@testable import MVP_Tests

final class InitialPresenterTests: XCTestCase {
    
    var view: InitialViewProtocol!
    var manager: NetworkManagerMock!
    var database: CoreDataManagerProtocol!
    var presenter: InitialPresenter!
    
    override func setUpWithError() throws {
        view = InitialVC()
        manager = NetworkManagerMock()
        database = CoreDataManager()
        presenter = InitialPresenter(view: view, manager: manager, database: database)
    }
    
    override func tearDownWithError() throws {
        view = nil
        manager = nil
        database = nil
        presenter = nil
    }
    
    func test_getUsersNetworking() throws {
        // Arrange
        var users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        manager.stubedResult = .success(users)
        // Act
        presenter.getUsersNetworking()
        // Assert
        XCTAssertEqual(users, presenter.users)
    }
    
    func test_saveNewUsers() throws {
        // Arrange
        var oldUsers: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        let newUsers: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]

        // Act
        let filteredUsers = newUsers.filter { !oldUsers.contains($0) }
        oldUsers.append(contentsOf: filteredUsers)
        if presenter.users.isEmpty {
            presenter.users = newUsers
        } else {
            presenter.saveNewUsers(databaseUsers: oldUsers, gotUsers: newUsers)
            presenter.getUsersDatabase()

        }
        // Assert
        XCTAssertEqual(oldUsers.sorted(by: { $0.name > $1.name }), presenter.users.sorted(by: { $0.name > $1.name }))

    }
}
