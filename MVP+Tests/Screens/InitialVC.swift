//
//  InitialVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import UIKit

class InitialVC: UIViewController {
    
    let initialTableView = UITableView()

    var presenter: InitialViewPresenterProtocol?
    var users: [Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        presenter?.getUsers()
    }
    
    private func configure() {
        title = String(describing: InitialVC.self)
        view.setInitialTableView(view: view, tableView: initialTableView, vc: self)
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
}
    
extension InitialVC: InitialViewProtocol {
    func setUsers(users: [Users]) {
        self.users = users
        initialTableView.reloadData()
    }
}
