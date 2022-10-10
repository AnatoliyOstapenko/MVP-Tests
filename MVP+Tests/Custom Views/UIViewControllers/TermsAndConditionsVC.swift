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
    let textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        urlDetector()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerView.setTermsAndConditionsContainer(view: view, container: containerView)
        scrollView.setScrollView(view: containerView, scrollView: scrollView)
        view.setTermsAndConditionsItems(scrollView: scrollView, contentView: contentView, textView: textView, button: termsButton)
        termsButton.addTarget(self, action: #selector(agreeButtonPressed), for: .touchUpInside)
    }
    
    func urlDetector() {
        textView.text = Constants.termsAndConditionsText
        textView.linkTextAttributes = [.foregroundColor: UIColor.blue]
        textView.isEditable = false
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.dataDetectorTypes = .link
    }
    
    @objc func agreeButtonPressed() {
        self.dismiss(animated: true)
    }


}
