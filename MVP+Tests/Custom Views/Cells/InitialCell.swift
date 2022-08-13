//
//  InitialCell.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 12.08.2022.
//

import UIKit

class InitialCell: UITableViewCell {
    
    static let reuseID = "InitialCell"
    
    let container = UIStackView()
    let nameLabel = CustomLabel(fontSize: 30, weight: .bold)
    let usernameLabel = CustomLabel(fontSize: 20, weight: .thin)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        contentView.setStackView(view: contentView, stackView: container, nameLabel: nameLabel, usernameLabel: usernameLabel)
    }
    
    func updateCell(users: Users) {
        nameLabel.text = users.name
        usernameLabel.text = users.username
    }
    
    func fakeCell(name: String) {
        nameLabel.text = name.uppercased()
        usernameLabel.text = "aka: \(name)"
    }


}
