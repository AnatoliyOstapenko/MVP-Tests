//
//  CustomError.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//

import Foundation

enum CustomError: String, Error {
    case failParsing = "JSON Parsing fails, chek out APIService"
    case failFetchFromDatabase = "Failed to fetch users from Database"
}
