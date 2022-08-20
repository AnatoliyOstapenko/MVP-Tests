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
    init (view: MapScreenViewProtocol, user: Users)
    func getCoordinate()
    
}

class MapScreenPresenter: MapScreenPresenterProtocol {
    weak var view: MapScreenViewProtocol?
    var user: Users
    required init(view: MapScreenViewProtocol, user: Users) {
        self.view = view
        self.user = user
    }

    func getCoordinate() {
        view?.setCordinate(latitude: user.address.geo.lat.stringToDouble,
                           longitude: user.address.geo.lng.stringToDouble)
    }
}


