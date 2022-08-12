//
//  InitialCell.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 12.08.2022.
//

import UIKit

class InitialCell: UITableViewCell {
    
    static let reuseID = "InitialCell"
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }


}
