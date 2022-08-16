//
//  Users.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation

struct Users: Codable {
    let name: String
    let username: String
    let address: Address
}

struct Address: Codable {
    var geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}
