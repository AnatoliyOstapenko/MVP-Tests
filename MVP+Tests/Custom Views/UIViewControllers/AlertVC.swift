//
//  AlertVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import UIKit

class AlertVC: UIViewController {
    
    let alertContainer = UIView()
    let alertLabel = CustomLabel(textColor: .white)
    let alertButton = CustomButton(textButton: "got it thanks")

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    init(errorText: String) {
        super.init(nibName: nil, bundle: nil)
        DispatchQueue.main.async {
            self.alertLabel.text = errorText
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        alertContainer.setAlertContainer(view: view, container: alertContainer)
        alertButton.setAlertButton(view: alertContainer, button: alertButton)
        alertLabel.setAlertLabel(view: alertContainer, button: alertButton, label: alertLabel)
        alertButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
    }
    
    @objc func alertButtonTapped() { dismiss(animated: true) } 
}
