//
//  APIService.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import Foundation

//enum Result <T> {
//    case Success(T)
//    case Error(String)
//}

protocol APIServiceProtocol {
    func getDataWith(completion: @escaping (Result <Data, CustomError>) -> Void)
}

class APIService: NSObject, APIServiceProtocol {
    
    func getDataWith(completion: @escaping (Result <Data, CustomError>) -> Void) {
        guard let url = Constants.url else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard error == nil, let data = data else { return }
            completion(.success(data))
        }
        task.resume()
    }
}


