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
    func setDataWith(service: Result<[String : AnyObject], Error>)
}

// Inside
protocol FlickrPresenterProtocol: AnyObject {
    init(view: FlickrViewProtocol, manager: APIServiceProtocol)
    func getDataWith()
}

class FlickrPresenter: FlickrPresenterProtocol {
    weak var view: FlickrViewProtocol?
    var manager: APIServiceProtocol
    
    required init(view: FlickrViewProtocol, manager: APIServiceProtocol) {
        self.view = view
        self.manager = manager
    }
    
    func getDataWith() {
        manager.getDataWith { [weak self] result in
            guard let self = self else { return }
//            print(result)
            self.view?.setDataWith(service: result)
        }
    }
}
