//
//  UIView+Ext.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation
import UIKit

private let padding: CGFloat = 10

extension UIView {

    // MARK: - InitialVC Layout
    func setInitialTableView(view: UIView, tableView: UITableView, vc: UIViewController) {
        view.addSubview(tableView)
        tableView.register(InitialCell.self, forCellReuseIdentifier: InitialCell.reuseID)
        tableView.dataSource = vc as? InitialVC
        tableView.delegate = vc as? InitialVC
        tableView.frame = view.bounds
    }
    
    // MARK: - InitialCell Layout
    func setStackView(view: UIView, stackView: UIStackView, nameLabel: UILabel, usernameLabel: UILabel) {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.systemCyan.cgColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: padding)
        ])
        
    }
    
    
    
    
    
}
