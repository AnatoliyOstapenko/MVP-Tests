//
//  CoreDataManagerTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 30.09.2022.
//

import XCTest
@testable import MVP_Tests

final class CoreDataManagerTests: XCTestCase {
    
    var sut: CoreDataManager!

    override func setUpWithError() throws {
        sut = CoreDataManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_saveUsersToDB() throws {
        // Arrange
        let users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.saveUsersToDB(users: users)
        // Assert
        XCTAssertEqual(sut.users.count, users.count)
        XCTAssertEqual(sut.users[0].user, "Bar")
    }
    
    func test_fetchUsersFromDB() throws {
        // Arrange
        let users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        sut.saveUsersToDB(users: users)
        // Act
        let expectation = XCTestExpectation()
        sut.fetchUsersFromDB { result in
            expectation.fulfill()
            switch result {
            case .success(let success):
                // Assert
                XCTAssertEqual(success.last?.name, "Bar")
            case .failure(_):
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 2)
    }
    
    func test_saveUserToDB() throws {
        // Arrange
        let users: Users = Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))
        // Act
        sut.saveUserToDB(user: users)
        // Assert
        XCTAssertEqual(sut.users.last?.user, users.name)
    }
    
    func test_deleteAllUsers() throws {
        // Arrange
        let users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.deleteAllUsers(users: users)
        // Assert
        XCTAssertEqual(sut.users, [])
    }
    
    func test_deleteUser() throws {
        // Arrange
        let users: Users = Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))
        // Act
        sut.saveUserToDB(user: users)
        sut.deleteUser(user: users)
        
        XCTAssertEqual(sut.users.count, 0)
    }


}
