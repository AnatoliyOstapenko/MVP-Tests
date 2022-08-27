//
//  Users.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 11.08.2022.
//

import Foundation

struct Users: Codable {
    var name: String
    var username: String
    let address: Address
}

struct Address: Codable {
    var geo: Geo
}

struct Geo: Codable {
    var lat: String
    var lng: String
}

