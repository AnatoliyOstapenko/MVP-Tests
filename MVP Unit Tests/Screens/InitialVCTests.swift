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
    var tableView: UITableView!
    var managerMock: NetworkManagerMock!
    var databaseMock: CoreDataManagerMock!
    var presenter: InitialPresenter!
    

    override func setUpWithError() throws {
        sut = InitialVC()
        tableView = sut.initialTableView
        tableView.dataSource = sut
        tableView.delegate = sut
        tableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        managerMock = NetworkManagerMock()
        databaseMock = CoreDataManagerMock()
        presenter = InitialPresenter(view: sut, manager: managerMock, database: databaseMock)
    }

    override func tearDownWithError() throws {
        sut = nil
        tableView = nil
        managerMock = nil
        databaseMock = nil
        presenter = nil
    }
    
    func test_numberOfRowsInSection() throws {
        // Arrange
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.setUsers(users: users)
        tableView.reloadData()
        // Assert
        XCTAssertEqual(sut.users.count, tableView.numberOfRows(inSection: 0))
    }
    
    func test_testCellForRowAt() {
        // Arrange
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        sut.setUsers(users: users)
        tableView.reloadData()
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is InitialCell)
    }
    
    func test_didSelectRowAt() {
        // Arrange
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.setUsers(users: users)
        tableView.reloadData()
        // Assert
        XCTAssertNotNil(tableView.delegate?.tableView!(tableView, didSelectRowAt: IndexPath(row: 0, section: 0)))
    }
    
    func test_heightForRowAt() {
        // Arrange
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333"))), Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        // Act
        sut.setUsers(users: users)
        tableView.reloadData()
        let height = sut.tableView(tableView, heightForRowAt: IndexPath(row: 0, section: 0))
        // Assert
        XCTAssertEqual(height, 100)
    }

    

    

}
