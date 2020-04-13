//
//  Deck+CoreDataProperties.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/10/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//
//

import Foundation
import CoreData


extension Deck: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var impAffirmative: Bool
    @NSManaged public var impNegative: Bool
    @NSManaged public var indPresent: Bool
    @NSManaged public var indPreterite: Bool
    @NSManaged public var subPresent: Bool
    @NSManaged public var subImperfect: Bool
    @NSManaged public var verbsToPractice: [String]

    var wrappedName: String {
        name ?? "Untitled Deck"
    }
}
