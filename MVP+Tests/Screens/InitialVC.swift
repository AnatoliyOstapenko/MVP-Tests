//
//  InitialVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import UIKit
import CoreData

class InitialVC: UIViewController {
    
    let initialTableView = UITableView()
    
    var presenter: InitialViewPresenterProtocol?
    var coordinator: CoordinatorProtocol?
    
    var users: [Users] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter?.getUsersNetworking()
    }
    
    private func configure() {
        title = String(describing: InitialVC.self)
        view.setInitialTableView(view: view, tableView: initialTableView, vc: self)
        setBarButtons()
    }
    
    private func setBarButtons() {
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = addBarButton
        let deleteBarButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(deleteButtonPressed(_:)))
        navigationItem.leftBarButtonItem = deleteBarButton
    }
    
    @objc private func deleteButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete all users", message: "Are you sure if you want to delete all users from the list", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            print("Total users: \(self.users.count)")
            self.presenter?.deleteAllUsers()
            self.presenter?.getUsersDatabase()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(deleteButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
    
    @objc private func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a new user", message: "type name and username", preferredStyle: .alert)
        
        alert.addTextField { textField in textField.placeholder = "name" }
        alert.addTextField { textField in textField.placeholder = "username" }

        let addButton = UIAlertAction(title: "add", style: .default) { _ in
        guard let textField = alert.textFields, let name = textField[0].text, let username = textField[1].text, !name.isEmpty, !username.isEmpty else {
            self.presentAlert(error: "Please type name and username to save")
            return
        }
            let user = Users(name: name, username: username, address: Address(geo: Geo(lat: "40.7128", lng: "74.0060")))
            self.presenter?.saveNewUser(user: user)
            self.users.append(user)
            self.initialTableView.reloadData()
        }
        
        let cancelButton = UIAlertAction(title: "cancel", style: .cancel)
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
}

extension InitialVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialCell.reuseID, for: indexPath) as! InitialCell
        cell.updateCell(users: users[indexPath.row])
        return cell
    }
}

extension InitialVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Wold you like to delete or see user location", message: nil, preferredStyle: .actionSheet)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            guard let self = self else { return }
            self.presenter?.deleteUser(user: self.users[indexPath.row])
            self.users.remove(at: indexPath.row)
            self.initialTableView.reloadData()
            
        }
        let locationButton = UIAlertAction(title: "See location", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.coordinator?.createMapScreen(user: self.users[indexPath.row])
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(deleteButton)
        alert.addAction(locationButton)
        alert.addAction(cancelButton)
        present(alert, animated: true)
    }
}

extension InitialVC: InitialViewProtocol {
    func setUsers(users: [Users]) {
        self.users = users
        initialTableView.reloadData()
    }
}
