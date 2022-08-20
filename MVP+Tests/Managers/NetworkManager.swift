//
//  NetworkManager.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 13.08.2022.
//

import Foundation

protocol NetworkManagerProtocol {
    func getUsers(completion: @escaping(Result<[Users],Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    func getUsers(completion: @escaping(Result<[Users],Error>) -> Void) {
        guard let url = Constants.url else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }

            do {
                let result = try JSONDecoder().decode([Users].self, from: data)
                completion(.success(result))
            } catch { completion(.failure(error))}
        }
        task.resume()
    }
}
