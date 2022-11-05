//
//  AlertVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import UIKit

// It's magic protocol that provides oppotunity to change modalPresentationStyle
// and avoid casting view at func showAlertVC (Coordinator class):
protocol MessageProtocol: UIViewController { var coordinator: CoordinatorProtocol? {get set} }

class AlertVC: UIViewController {
    
    let alertContainer = UIView()
    let alertLabel = CustomLabel(textColor: .red)
    let alertButton = CustomButton(textButton: Constants.ok)
    
    var coordinator: CoordinatorProtocol?

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
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        alertContainer.setAlertContainer(view: view, container: alertContainer)
        alertButton.setAlertButton(view: alertContainer, button: alertButton)
        alertLabel.setAlertLabel(view: alertContainer, button: alertButton, label: alertLabel)
        alertButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        dismiss(animated: true)
    }
}

extension AlertVC: MessageProtocol {}
