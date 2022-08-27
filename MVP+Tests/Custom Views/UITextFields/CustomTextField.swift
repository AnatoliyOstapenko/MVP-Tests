//
//  CustomTextField.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 28.08.2022.
//

import UIKit

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderColor = UIColor.systemBlue.cgColor
        layer.borderWidth = 2
        textAlignment = .center
        font = .preferredFont(forTextStyle: .headline)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 7
        translatesAutoresizingMaskIntoConstraints = false
    }
}

