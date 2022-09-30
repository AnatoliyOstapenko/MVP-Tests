//
//  MapScreenPresenterTests.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 30.09.2022.
//

import XCTest
@testable import MVP_Tests

final class MapScreenPresenterTests: XCTestCase {
    
    var view: MapScreenVC!
    var model: Users!
    var presenter: MapScreenPresenterProtocol!
    
    override func setUpWithError() throws {
        view = MapScreenVC()
        model = Users(name: "Bar", username: "Foo", address: Address(geo: Geo(lat: "000", lng: "111")))
        presenter = MapScreenPresenter(view: view, user: model)
    }

    override func tearDownWithError() throws {
        view = nil
        model = nil
        presenter = nil
    }
    
    func test_getCoordinate() {
        // Arrange
        let latitude = presenter.user.address.geo.lat.stringToDouble
        // Act
        presenter.getCoordinate()
        // Assert
        XCTAssertEqual(latitude, view.latitude)
    }

}
