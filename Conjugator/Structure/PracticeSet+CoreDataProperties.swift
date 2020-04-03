//
//  PracticeSet+CoreDataProperties.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/3/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//
//

import Foundation
import CoreData


extension PracticeSet: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PracticeSet> {
        return NSFetchRequest<PracticeSet>(entityName: "PracticeSet")
    }

    @NSManaged public var name: String
    @NSManaged public var id: UUID?
    @NSManaged public var indPresent: Bool
    @NSManaged public var indPreterite: Bool
    @NSManaged public var subPresent: Bool
    @NSManaged public var subImperfect: Bool
    @NSManaged public var impNegative: Bool
    @NSManaged public var impAffirmative: Bool
    @NSManaged public var verbsToPractice: [String]

}
