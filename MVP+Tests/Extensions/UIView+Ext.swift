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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
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
    
    // MARK: - MapScreenVC Layout
    
    func setMapView(view: UIView, mapView: UIView) {
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - AlertVC Layout
    
    func setAlertContainer(view: UIView, container: UIView) {
        view.addSubview(container)
        container.layer.cornerRadius = 10
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.white.cgColor
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 220),
            container.widthAnchor.constraint(equalToConstant: 280)
        ])
    }
    
    func setAlertButton(view: UIView, button: UIButton) {
        view.addSubview(button)
        
        
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding * 2),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 2),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 2),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setAlertLabel(view: UIView, button: UIButton, label: UILabel) {
        label.numberOfLines = 4
        label.textAlignment = .center
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: padding * 2),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 2),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 2),
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -padding * 2)
        ])
    }
    

    
}
