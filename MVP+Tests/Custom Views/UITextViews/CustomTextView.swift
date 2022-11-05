//
//  CustomTextView.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 26.10.2022.
//

import UIKit

class CustomTextView: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String) {
        self.init(frame: .zero, textContainer: nil)
        attributedText = NSAttributedString(string: text)
    }
    
    private func configure() {
        // interaction with web:
        linkTextAttributes = [.foregroundColor: UIColor.blue]
        dataDetectorTypes = .link

        textAlignment = .natural
        isEditable = false
        isSelectable = true
        isUserInteractionEnabled = true
        
        textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // constraints
        
        // Shadow for textView
//        layer.shadowColor = UIColor.gray.cgColor;
//        layer.shadowOffset = CGSize(width: 0.75, height: 0.75)
//        layer.shadowOpacity = 0.4
//        layer.shadowRadius = 20
//        layer.masksToBounds = false
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
