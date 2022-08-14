//
//  Coordinate.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 14.08.2022.
//

import Foundation

struct Coordinate: Codable {
    let address: Address
}

struct Address: Codable {
    let geo: Geo
}

struct Geo: Codable {
    let lat: String
    let lng: String
}
