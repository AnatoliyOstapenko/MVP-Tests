//
//  InitialCellTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 25.09.2022.
//

import XCTest
@testable import MVP_Tests

final class InitialCellTests: XCTestCase {
    
    var sut: InitialVC!

    override func setUpWithError() throws {
        sut = InitialVC()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_updateCell() throws {
        let users: [Users] = [Users(name: "Baz", username: "Bar", address: Address(geo: Geo(lat: "222", lng: "333")))]
        sut.initialTableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        
        let cell = sut.initialTableView.dequeueReusableCell(withIdentifier: InitialCell.reuseID) as! InitialCell
        cell.updateCell(users: users[0])
   
        XCTAssertEqual(users[0].name, cell.nameLabel.text)
        XCTAssertEqual(users[0].username, cell.usernameLabel.text)
    }


}
