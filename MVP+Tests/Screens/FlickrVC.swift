//
//  FlickrVC.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import UIKit

class FlickrVC: UIViewController {
    
    var presenter: FlickrPresenterProtocol?
    var coordinator: Coordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        presenter?.getDataWith(view: self)
    }

}

extension FlickrVC: FlickrViewProtocol {
    func setDataWith(service: [[String : AnyObject]]) {
    print(service)
        
    }
    
    
}


