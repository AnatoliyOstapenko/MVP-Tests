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
    
    convenience init(fontSize: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        self.font = .systemFont(ofSize: fontSize, weight: weight)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.7
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }

}
