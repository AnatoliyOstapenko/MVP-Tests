//
//  User+CoreDataProperties.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 21.08.2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var username: String?
//    @NSManaged public var latitude: Double
//    @NSManaged public var longitude: Double

}

extension User : Identifiable {

}
