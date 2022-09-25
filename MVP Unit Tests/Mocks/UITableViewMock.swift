//
//  UITableViewMock.swift
//  MVP Unit Tests
//
//  Created by AnatoliiOstapenko on 25.09.2022.
//

import Foundation
import UIKit
@testable import MVP_Tests

class UITableViewMock: UITableView {
    var cellIsDequeued = false
    
    func tableViewMock(dataSource: UITableViewDataSource) -> UITableViewMock {
        let tableViewMock = UITableViewMock(frame: CGRect(x: 0, y: 0, width: 375, height: 658))
        tableViewMock.dataSource = dataSource
        tableViewMock.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        return tableViewMock
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        cellIsDequeued = true
        return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    }
}
