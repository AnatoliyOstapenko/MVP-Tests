//
//  CustomButton.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textButton: String) {
        self.init(frame: .zero)
        setTitle(textButton, for: .normal)
    }
    
    private func configure() {
        layer.backgroundColor = UIColor.red.cgColor
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = .white
        titleLabel?.font = .preferredFont(forTextStyle: .headline)
        titleLabel?.adjustsFontSizeToFitWidth = true
        titleLabel?.minimumScaleFactor = 0.7
        translatesAutoresizingMaskIntoConstraints = false
    }
}
