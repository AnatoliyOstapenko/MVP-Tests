//
//  FlickrPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import Foundation
import UIKit

// Outside
protocol FlickrViewProtocol: AnyObject {
    func setDataWith(service: [[String : AnyObject]])
}

// Inside
protocol FlickrPresenterProtocol: AnyObject {
    init(view: FlickrViewProtocol, manager: APIServiceProtocol)
    func getDataWith(view: UIViewController)
}

class FlickrPresenter: FlickrPresenterProtocol {
    weak var view: FlickrViewProtocol?
    var manager: APIServiceProtocol
    
    required init(view: FlickrViewProtocol, manager: APIServiceProtocol) {
        self.view = view
        self.manager = manager
    }
    
    func getDataWith(view: UIViewController) {
        manager.getDataWith { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let service):
                self.view?.setDataWith(service: service)
            case .failure(let error):
                DispatchQueue.main.async {
                    view.presentAlert(error: error.localizedDescription)
                }
            }
            
        }
    }
}
