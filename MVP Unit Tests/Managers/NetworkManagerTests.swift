//
//  NetworkManagerTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 26.09.2022.
//

import XCTest
@testable import MVP_Tests

final class NetworkManagerTests: XCTestCase {
    
    var sut: NetworkManager!
    var managerMock: NetworkManagerMock!
    var view: InitialVC!


    override func setUpWithError() throws {
        sut = NetworkManager()
        managerMock = NetworkManagerMock()
        view = InitialVC()
    }

    override func tearDownWithError() throws {
        sut = nil
        managerMock = nil
        view = nil
    }
    
    
    func test_getUsers() {
        let users: [Users] = [Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))]
        view.setUsers(users: users)
        let expectation = XCTestExpectation() // create expectation before acync method
        
        self.sut.getUsers { result in
            print("fulfill invoked")
            expectation.fulfill() // triggered after wait method
            switch result {
            case .success(let success):
                print(success)
                XCTAssertEqual(self.view.users[0].name, "Bar")
            case .failure(_):
                XCTFail()
            }
        }
        print("Before wait")
        wait(for: [expectation], timeout: 2) // create wait method in the end of block for testing
        print("After wait")
    }
}
