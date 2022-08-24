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
    var persistentContainer = CoreDataManager.shared
    
    required init(view: FlickrViewProtocol, manager: APIServiceProtocol) {
        self.view = view
        self.manager = manager
    }
    
    func getDataWith(view: UIViewController) {
        
        manager.getDataWith { result in
            switch result {
            case .success(let data):
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]else { return }
                    
                    let users: [UserModel] = json.compactMap { [weak self] in
                        guard let self = self,
                              let name = $0["name"] as? String,
                              let username = $0["username"] as? String else { return nil }
                        
                        let user = UserModel(context: self.persistentContainer.context)
                        user.user = name
                        user.username = username
                        
                        return user
                    }
                    
                    print(users)
                    
                } catch { print(error.localizedDescription)}
            case .failure(let error): print(error)
            }
        }
    }
           
}
