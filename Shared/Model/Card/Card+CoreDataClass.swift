//
//  Card+CoreDataClass.swift
//  OnCue
//
//  Created by Pradyun Setti on 2/12/21.
//
//

import Foundation
import CoreData

@objc(Card)
public class Card: NSManagedObject, Codable {
    enum CodingKeys: CodingKey {
        case id, position, text, project
    }
    
    // MARK: Decodable Conformance
    public required convenience init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else {
            fatalError()
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Card", in: context) else { fatalError() }
        
        self.init(entity: entity, insertInto: context)
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(UUID.self, forKey: .id)
        self.position = try container.decode(Int16.self, forKey: .position)
        self.text = try container.decode(String.self, forKey: .text)
        self.project = try container.decode(Project.self, forKey: .project)
    }
    
    // MARK: Encodable Conformance
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(position, forKey: .position)
        try container.encode(text, forKey: .text)
        try container.encode(project, forKey: .project)
    }
}
