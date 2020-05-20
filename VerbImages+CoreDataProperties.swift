//
//  VerbImages+CoreDataProperties.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/23/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//
//

import Foundation
import CoreData


extension VerbImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VerbImages> {
        return NSFetchRequest<VerbImages>(entityName: "VerbImages")
    }

    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    
    var wrappedName: String {
        name ?? "Untitled"
    }
}
