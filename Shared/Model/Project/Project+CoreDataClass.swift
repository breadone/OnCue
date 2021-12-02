//
//  Project+CoreDataClass.swift
//  OnCue
//
//  Created by Pradyun Setti on 2/12/21.
//
//

import Foundation
import CoreData

@objc(Project)
public class Project: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, name, dateCreated, cards
    }
    
    // MARK: Decodable Conformance
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { fatalError() }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Project", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.dateCreated = try container.decode(Date.self, forKey: .dateCreated)
        let cardArray = try container.decode([Card].self, forKey: .cards)
        self.cards = NSSet(array: cardArray)
    }
    
    // MARK: Encodable Conformance
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(dateCreated, forKey: .dateCreated)
        try container.encode(cards as! Set<Card>, forKey: .cards)
    }
    
}
