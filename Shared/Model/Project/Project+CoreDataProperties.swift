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
    @NSManaged public var cards: [Card]?
    
    public var wrappedName: String {
        self.name ?? "No Name"
    }
    
    public var wrappedCards: [Card] {
        self.cards ?? []
    }
    
}

extension Project: Identifiable {
    public static func add(context: NSManagedObjectContext, name: String) {
        let newProject = Project(context: context)
        newProject.id = UUID()
        newProject.name = name
        newProject.dateCreated = Date()
        newProject.cards = []
        try? context.save()
    }
}
