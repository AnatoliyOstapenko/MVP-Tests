//
//  TermsAndConditionsVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 08.10.2022.
//

import UIKit

class TermsAndConditionsVC: UIViewController {
    
    // UI
    let containerView = UIView()
    let scrollView = UIScrollView()
    let contentView = UIView()
    let stackView = UIStackView()
    let termsButton = CustomButton(textButton: "Agree")
    let textView = CustomTextView(text: Constants.termsAndConditionsText)
    var textMessage: String?
    
    // Object Relations
    var coordinator: CoordinatorProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        // Determine RTL or LTR is enabled
        if view.effectiveUserInterfaceLayoutDirection == .rightToLeft {
            print("rightToLeft")
        } else if view.effectiveUserInterfaceLayoutDirection == .leftToRight {
            print("leftToRight")
        }
        
    }
    
    init(text: String) {
        super.init(nibName: nil, bundle: nil)
        textMessage = text
        let nsAtributedString = NSAttributedString(string: text)
        textView.attributedText = nsAtributedString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerView.setTermsAndConditionsContainer(view: view, container: containerView)
        scrollView.setScrollView(view: containerView, scrollView: scrollView)
        view.setTermsAndConditionsItems(scrollView: scrollView, contentView: contentView, textView: textView, button: termsButton)
        termsButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        dismiss(animated: true)
        coordinator?.goToInitialScreen()
    }
}

extension TermsAndConditionsVC: MessageProtocol {}
