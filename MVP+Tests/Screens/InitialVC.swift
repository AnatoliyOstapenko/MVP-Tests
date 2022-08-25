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
        setBarButton()
    }
    
    private func setBarButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonPressed(_:)))
        navigationItem.rightBarButtonItem = barButton
    }
    
    @objc private func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add a new user", message: "type name and username", preferredStyle: .alert)
        alert.addTextField() // for name
        alert.addTextField() // for username
        
        let addButton = UIAlertAction(title: "add", style: .default) { _ in
            guard let textField = alert.textFields, let name = textField[0].text, let username = textField[1].text else { return }
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
        coordinator?.createMapScreen(user: users[indexPath.row])
    }
}

extension InitialVC: InitialViewProtocol {
    func setUsers(users: [Users]) {
        self.users = users
        initialTableView.reloadData()
    }
}

