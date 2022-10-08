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
    let termsLabel = LogoLabel(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        containerView.setTermsAndConditionsContainer(view: view, container: containerView)
        scrollView.setScrollView(view: containerView, scrollView: scrollView)
        view.setTermsAndConditionsItems(scrollView: scrollView, contentView: contentView, label: termsLabel, button: termsButton)
        termsButton.addTarget(self, action: #selector(agreeButtonPressed), for: .touchUpInside)
    }
    
    @objc func agreeButtonPressed() {
        self.dismiss(animated: true)
    }


}
