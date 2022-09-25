//
//  InitialVCTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 25.09.2022.
//

import XCTest
@testable import MVP_Tests

final class InitialVCTests: XCTestCase {
    
    var sut: InitialVC!
    var managerMock: NetworkManagerMock!
    var databaseMock: CoreDataManagerMock!

    var presenter: InitialPresenter!
    

    override func setUpWithError() throws {
        sut = InitialVC()
        managerMock = NetworkManagerMock()
        databaseMock = CoreDataManagerMock()
        presenter = InitialPresenter(view: sut, manager: managerMock, database: databaseMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        managerMock = nil
        databaseMock = nil
        presenter = nil
    }
    
    func test_numberOfRowsInSection() throws {
        // Arrange
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.setUsers(users: users)
        sut.initialTableView.dataSource = sut
        sut.initialTableView.reloadData()
        // Assert
        XCTAssertEqual(sut.users.count, sut.initialTableView.numberOfRows(inSection: 0))
    }
    

    

    

}
