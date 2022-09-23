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
    var managerMock: NetworkManagerMock!
    var databaseMock: CoreDataManagerMock!
    var presenter: InitialPresenter!
    
    override func setUpWithError() throws {
        view = InitialVC()
        managerMock = NetworkManagerMock()
        databaseMock = CoreDataManagerMock()
        presenter = InitialPresenter(view: view, manager: managerMock, database: databaseMock)
    }
    
    override func tearDownWithError() throws {
        view = nil
        managerMock = nil
        databaseMock = nil
        presenter = nil
    }
    
    func test_getUsersNetworking() throws {
        // Arrange
        let users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        managerMock.stubedResult = .success(users)
        // Act
        presenter.getUsersNetworking() // presenter is already assembled with the managerMock
        // Assert
        XCTAssertEqual(users, presenter.databaseUsers)
    }
    
    func test_getUsersNetworkingFails() throws {
        // Arrange
        if let error = CustomError(rawValue: "JSON Parsing fails, chek out APIService") {
            managerMock.stubedResult = .failure(error)
            // Act
            presenter.getUsersNetworking()
            // Assert
            XCTAssertEqual(error, presenter.error)
        } else {
            XCTFail()
        }
    }
    
    func test_saveNewUsersWhenDatabaseUsersIsNotEmpty() throws {
        // Arrange
        let databaseUsers: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        let gotUsers: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        var resultArray: [Users] = databaseUsers

        // Act
        let filteredUsers = gotUsers.filter { !databaseUsers.contains($0) }
        resultArray.append(contentsOf: filteredUsers)
        
        managerMock.stubedResult = .success(databaseUsers)
        presenter.getUsersNetworking()
        if !presenter.databaseUsers.isEmpty {
            presenter.saveNewUsers(databaseUsers: databaseUsers, gotUsers: gotUsers)
        } else {
            XCTFail()
        }

        // Assert
        XCTAssertEqual(resultArray.sorted(by: { $0.name > $1.name }), presenter.databaseUsers.sorted(by: { $0.name > $1.name }))
    }
    
    func test_getUsersDatabase() throws {
        // Arrange
        let databaseUsers: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        databaseMock._fetchUsersFromDB = .success(databaseUsers)
        // Act
        presenter.getUsersDatabase()
        // Assert
        XCTAssertEqual(databaseUsers, presenter.databaseUsers)
    }
    
    func test_deleteAllUsers() throws {
        let databaseUsers: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        presenter.deleteAllUsers(users: databaseUsers)
    }
    
    func test_saveNewUser() throws {
        // Arrange
        let user = Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))
        var users: [Users] = []
        users.append(user)
        // Act
        presenter.saveNewUser(user: user)
        // Assert
        XCTAssertEqual(users, presenter.databaseUsers)
    }
    
    func test_deleteUser() throws {
        // Arrange
        let user = Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))
        var users: [Users] = []
        // Act
        presenter.deleteUser(user: user)
        // Assert
        XCTAssertEqual(users, presenter.databaseUsers)
    }
    
    

    

}
