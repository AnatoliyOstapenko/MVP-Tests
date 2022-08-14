//
//  InitialPresenterTests.swift
//  MVP+TestsTests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import XCTest
@testable import MVP_Tests

class InitialPresenterTests: XCTestCase {
    
    var view: InitialVCMock!
    var presenter: InitialPresenter!
    var manager: NetworkManager!

    override func setUpWithError() throws {
        try super.setUpWithError()
        view = InitialVCMock()
        presenter = InitialPresenter(view: view, manager: manager)
        manager = NetworkManager()
    }

    override func tearDownWithError() throws {
        manager = nil
        view = nil
        presenter = nil
        try super.tearDownWithError()
    }

}
