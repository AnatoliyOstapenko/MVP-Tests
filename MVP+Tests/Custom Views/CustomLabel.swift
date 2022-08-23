//
//  CustomLabel.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 12.08.2022.
//

import UIKit

class CustomLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    convenience init(textColor: UIColor) {
        self.init(frame: .zero)
        self.textColor = textColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        //backgroundColor = .systemBackground
        adjustsFontSizeToFitWidth = true
        font = .systemFont(ofSize: 20, weight: .regular)
        minimumScaleFactor = 0.7
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }

}
