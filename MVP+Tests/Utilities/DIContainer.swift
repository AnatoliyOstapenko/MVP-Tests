//
//  DIContainer.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 21.10.2022.
//

import Foundation

protocol DIContainerProtocol {
    func register<Service>(type: Service.Type, service: Any)
    func resolve<Service>(type: Service.Type) -> Service?
}

class DIContainer: DIContainerProtocol {
    
    static let shared = DIContainer()
    private init() {}
    
    private var services: [String: Any] = [:]
    
    func register<Service>(type: Service.Type, service: Any) {
        services["\(type)"] = service
    }
    
    func resolve<Service>(type: Service.Type) -> Service? {
        return services["\(type)"] as? Service
    }
    
    
}
