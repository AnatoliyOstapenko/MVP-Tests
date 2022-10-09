//
//  TermsAndConditionsVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 08.10.2022.
//

import UIKit

class TermsAndConditionsVC: UIViewController {
    
    let containerView = UIView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    let termsButton = CustomButton(textButton: "Agree")
    let termsLabel = UILabel()
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
//        configureTextLabel()
        configureTextView()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerView.setTermsAndConditionsContainer(view: view, container: containerView)
        scrollView.setScrollView(view: containerView, scrollView: scrollView)
        view.setTermsAndConditionsItems(scrollView: scrollView, contentView: contentView, label: textView, button: termsButton)
        termsButton.addTarget(self, action: #selector(agreeButtonPressed), for: .touchUpInside)
    }
    
    private func configureTextLabel() {
        termsLabel.text = Constants.textLabel
        termsLabel.font = UIFont.systemFont(ofSize: 12)
        termsLabel.numberOfLines = 0
        termsLabel.minimumScaleFactor = 0.7
        termsLabel.adjustsFontSizeToFitWidth = true
    }
    
    private func configureTextView() {
        let attributedString = NSMutableAttributedString(string: "Just click here to register")
        let url = URL(string: "https://www.apple.com")!

        // Set the 'click here' substring to be the link
        attributedString.setAttributes([.link: url], range: NSMakeRange(5, 10))

        self.textView.attributedText = attributedString
        self.textView.isUserInteractionEnabled = true
        self.textView.isEditable = false

        // Set how links should appear: blue and underlined
        self.textView.linkTextAttributes = [
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    @objc func agreeButtonPressed() {
        self.dismiss(animated: true)
    }


}
