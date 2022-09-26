//
//  NetworkManagerTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 26.09.2022.
//

import XCTest
@testable import MVP_Tests

final class NetworkManagerTests: XCTestCase {
    

    var manager: NetworkManager!


    override func setUpWithError() throws {

        manager = NetworkManager()

    }

    override func tearDownWithError() throws {
        manager = nil

    }
    
    func test_pieceOfOtherShitFromFYouTube() throws {
        // Arrange
        let json = """
{
    "name": "Leanne Graham",
    "username": "Bret",
    "address": {
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    }
  }
"""
        // Act
        let jsonData = json.data(using: .utf8)!
        do {
            let data = try JSONDecoder().decode(Users.self, from: jsonData)
            // Assert
            XCTAssertEqual("Leanne Graham", data.name)
            XCTAssertEqual("81.1496", data.address.geo.lng)
        } catch { XCTFail() }
       

        
        
    }
    
    func test_getUsers() {
        var num: [Users] = []
        DispatchQueue.main.async {
            self.manager.getUsers { result in
                switch result {
                case .success(let success):
                    num = success
                case .failure(let failure):
                    XCTFail()
                }
            }
        }
        
        print("num is count: \(num.count) and text: \(num)")

        
//        XCTAssertEqual(users[0].name, initialVC.users[0].name)
    }
    
    


}
