//
//  CredentialsPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 15.09.2022.
//

import Foundation
import UIKit

protocol CredentialViewProtocol: AnyObject {}
protocol CredentialPresenterProtocol: AnyObject {
    var view: CredentialViewProtocol? {get set}
    init(view: CredentialViewProtocol)
}

class CredentialsPresenter: CredentialPresenterProtocol {
    weak var view: CredentialViewProtocol?
    
    required init(view: CredentialViewProtocol) {
        self.view = view
    }
    
    
}
