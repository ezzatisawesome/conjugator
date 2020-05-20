//
//  Deck+CoreDataProperties.swift
//  Conjugator
//
//  Created by Ezzat Suhaime on 4/19/20.
//  Copyright © 2020 Ezzat Suhaime. All rights reserved.
//
//

import Foundation
import CoreData


extension Deck: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Deck> {
        return NSFetchRequest<Deck>(entityName: "Deck")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var impAffirmative: Bool
    @NSManaged public var impNegative: Bool
    @NSManaged public var indPresent: Bool
    @NSManaged public var indPreterite: Bool
    @NSManaged public var name: String?
    @NSManaged public var subImperfect: Bool
    @NSManaged public var subPresent: Bool
    @NSManaged public var verbsToPractice: [String]
    @NSManaged public var indFuture: Bool
    @NSManaged public var indImperfect: Bool
    @NSManaged public var indConditional: Bool
    @NSManaged public var indPresentPerfect: Bool
    @NSManaged public var indFuturePerfect: Bool
    @NSManaged public var indPastPerfect: Bool
    @NSManaged public var indConditionalPerfect: Bool
    @NSManaged public var indPreteriteArchaic: Bool
    @NSManaged public var subFuture: Bool
    @NSManaged public var subPresentPerfect: Bool
    @NSManaged public var subFuturePerfect: Bool
    @NSManaged public var subPastPerfect: Bool

    var wrappedName: String {
        name ?? "Untitled Deck"
    }
}
