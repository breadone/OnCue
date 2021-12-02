//
//  Card+CoreDataProperties.swift
//  OnCue
//
//  Created by Pradyun Setti on 2/12/21.
//
//

import Foundation
import CoreData


extension Card {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Card> {
        return NSFetchRequest<Card>(entityName: "Card")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var position: Int16
    @NSManaged public var text: String?
    @NSManaged public var project: Project?
    
    public var wrappedText: String {
        self.text ?? "No Text"
    }
}

extension Card : Identifiable {
    
    
}
