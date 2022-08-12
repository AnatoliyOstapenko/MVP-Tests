//
//  InitialVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import UIKit

class InitialVC: UIViewController {
    
    let initialTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = String(describing: InitialVC.self)
        view.backgroundColor = .systemMint
    }
    
    private func configure() {
        
    }
}

extension InitialVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InitialCell.reuseID, for: indexPath) as! InitialCell
        return cell
    }
    
}
