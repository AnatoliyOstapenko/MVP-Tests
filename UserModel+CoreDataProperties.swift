//
//  UserModel+CoreDataProperties.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 24.08.2022.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "UserModel")
    }

    @NSManaged public var user: String?
    @NSManaged public var username: String?

}

extension UserModel : Identifiable {

}
