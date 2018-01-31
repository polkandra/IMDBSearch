//
//  Film+CoreDataProperties.swift
//  IMDBSearch
//
//  Created by Mikhail Kozlyukov on 31.01.2018.
//  Copyright © 2018 Chebahatt. All rights reserved.
//
//

import Foundation
import CoreData


extension Film {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Film> {
        return NSFetchRequest<Film>(entityName: "Film")
    }

    @NSManaged public var name: String?
    @NSManaged public var genre: String?
    @NSManaged public var duration: Int16
    @NSManaged public var premier: String?
    @NSManaged public var country: String?
    @NSManaged public var rating: Double
    @NSManaged public var production: String?
    @NSManaged public var language: String?
    @NSManaged public var discription: String?
    @NSManaged public var poster: NSData?
    @NSManaged public var director: String?

}
