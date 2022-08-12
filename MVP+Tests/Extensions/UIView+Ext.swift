//
//  UIView+Ext.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation
import UIKit

extension UIView {

    // MARK: - InitialVC Layout
    func setInitialTableView(view: UIView, tableView: UITableView, vc: UIViewController) {
        view.addSubview(tableView)
        tableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        tableView.dataSource = vc as? InitialVC
        tableView.frame = view.bounds
    }
    
    // MARK: - InitialCell Layout
    func set
    
    
}
