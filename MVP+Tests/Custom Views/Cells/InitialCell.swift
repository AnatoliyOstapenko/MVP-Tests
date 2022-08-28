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
    let nameLabel = CustomLabel(textColor: .label)
    let usernameLabel = CustomLabel(textColor: .label)

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
    
    func updateCell(users: Users, number: Int) {
        nameLabel.text = "\(number + 1): \(users.name)"
        usernameLabel.text = users.username
    }
}
