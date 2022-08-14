//
//  MapScreenPresenter.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import Foundation

protocol MapScreenViewProtocol: AnyObject {
    func setCordinate(latitude: Double, longitude: Double)
}

protocol MapScreenPresenterProtocol: AnyObject {
    init (view: MapScreenViewProtocol, manager: NetworkManager)
    func getCoordinate()
    
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    weak var view: MapScreenViewProtocol?
    var manager: NetworkManager
    
    required init(view: MapScreenViewProtocol, manager: NetworkManager) {
        self.view = view
        self.manager = manager
    }
    
    func getCoordinate() {
        manager.getCoordinate { [weak self] results in
            guard let self = self else { return }
            switch results {
            case .success(let coordinates):
                DispatchQueue.main.async {
                    self.view?.setCordinate(latitude: coordinates.lat.stringToDouble, longitude: coordinates.lng.stringToDouble)
                }
            case .failure(let error): print(error)
            }
        }
    }
}

private extension String {
    var stringToDouble: Double {
        if let item = Double(self) {
            return item
        }
        return 0
    }
}
