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
    func getDataWith(completion: @escaping (Result<[[String: AnyObject]], CustomError>) -> Void)
}

class APIService: NSObject, APIServiceProtocol {
    
    let query = "cat"
    lazy var endPoint: String = {
        return "https://api.flickr.com/services/feeds/photos_public.gne?format=json&tags=\(query)&nojsoncallback=1#"
    }()
    
    func getDataWith(completion: @escaping (Result <[[String: AnyObject]], CustomError>) -> Void) {
        guard let url = URL(string: endPoint) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("ERROR exist")
                return }
            guard let data = data else {
                print("DATA doesn't exist")
                return }
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as? [String: AnyObject] {
                    guard let itemsJsonArray = json["items"] as? [[String: AnyObject]] else {
                        completion(.failure(.failParsing))
                        return  }
                    DispatchQueue.main.async {
                        completion(.success(itemsJsonArray))
                    }
                }
            } catch { completion(.failure(.failParsing)) }
        }.resume()
    }
}


