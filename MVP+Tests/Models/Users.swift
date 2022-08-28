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
    var lat: String
    var lng: String
}

// Add it to compare two arrays (New users with current users).
// geo data is dynamic - don't add it to compare
extension Users: Equatable {
    static func == (lhs: Users, rhs: Users) -> Bool {
        lhs.name == rhs.name &&
        lhs.username == rhs.username
    }
}

