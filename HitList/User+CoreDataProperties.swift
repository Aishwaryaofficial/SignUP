//
//  User+CoreDataProperties.swift
//  HitList
//
//  Created by Appinventiv on 24/02/17.
//  Copyright © 2017 Razeware. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User");
    }

    @NSManaged public var address: String?
    @NSManaged public var dob: String?
    @NSManaged public var email: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?
    @NSManaged public var userName: String?

}
