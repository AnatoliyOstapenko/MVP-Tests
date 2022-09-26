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
    func setMainContainer(view: UIView, stackView: UIStackView, label: UILabel, rightContainer: UIStackView) {
        view.addSubview(stackView)
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(rightContainer)
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.systemPink.cgColor
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            label.topAnchor.constraint(equalTo: stackView.topAnchor),
            label.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            label.widthAnchor.constraint(lessThanOrEqualToConstant: 40)
        ])
    }

    func setRightStackView(stackView: UIStackView, nameLabel: UILabel, usernameLabel: UILabel) {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(usernameLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.red.cgColor
        
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
    
    // MARK: - CredentialsVC
    
    func setCredentialsStackView(view: UIView, stack: UIStackView, login: UITextField, password: UITextField) {
        view.addSubview(stack)
        stack.addArrangedSubview(login)
        stack.addArrangedSubview(password)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        login.placeholder = "Login"
        password.placeholder = "Password"
        stack.spacing = 5
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            stack.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func setCredentialButton(superview: UIView, view: UIView, button: UIButton, stackView: UIStackView) {
        superview.addSubview(view)
        view.addSubview(button)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            view.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            view.bottomAnchor.constraint(equalTo: superview.bottomAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 75),
            button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
    }
    

    
}
