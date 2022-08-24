//
//  Photo+CoreDataProperties.swift
//  MVP+Tests
//
//  Created by AnatoliiOstapenko on 23.08.2022.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var author: String?
    @NSManaged public var mediaURL: String?
    @NSManaged public var tags: String?

}

extension Photo : Identifiable {

}
