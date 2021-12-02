//
//  Project+CoreDataProperties.swift
//  OnCue
//
//  Created by Pradyun Setti on 2/12/21.
//
//

import Foundation
import CoreData


extension Project {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var dateCreated: Date
    @NSManaged public var cards: NSSet?
    
    public var wrappedName: String {
        self.name ?? "No Name"
    }
    
}

// MARK: Generated accessors for cards
extension Project {
    
    @objc(addCardsObject:)
    @NSManaged public func addToCards(_ value: Card)
    
    @objc(removeCardsObject:)
    @NSManaged public func removeFromCards(_ value: Card)
    
    @objc(addCards:)
    @NSManaged public func addToCards(_ values: NSSet)
    
    @objc(removeCards:)
    @NSManaged public func removeFromCards(_ values: NSSet)
    
}

extension Project: Identifiable {

}
