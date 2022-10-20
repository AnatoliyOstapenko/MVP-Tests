//
//  LogoLabel.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 16.09.2022.
//

import UIKit

class LogoLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func configure() {
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        minimumScaleFactor = 0.7
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        
        let attrString = NSMutableAttributedString(string: "", attributes: [
            .foregroundColor: UIColor.darkText,
            .paragraphStyle: style,
            .font: UIFont.systemFont(ofSize: 8)
        ])

        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: Constants.logo)
        attachment.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        attrString.append(NSAttributedString(attachment: attachment))
        attributedText = attrString
    }

    

}
