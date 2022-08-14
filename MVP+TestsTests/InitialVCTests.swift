//
//  InitialVCTests.swift
//  MVP+TestsTests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import XCTest
@testable import MVP_Tests

class InitialVCTests: XCTestCase {

    var view: InitialVCMock!
    var manager: NetworkManager!
    var presenter: InitialPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = InitialVCMock()
        manager = NetworkManager()
        presenter = InitialPresenter(view: view, manager: manager)
    }
    
    override func tearDownWithError() throws {
        manager = nil
        view = nil
        presenter = nil
        try super.tearDownWithError()
    }

}
