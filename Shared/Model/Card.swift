//
//  Card.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

@objc(Card)
public class Card: NSObject, Codable, Identifiable {
    public required init?(coder: NSCoder) {
        guard
            let id = coder.decodeObject(of: [NSUUID.self], forKey: "id") as? UUID,
            let position = coder.decodeObject(of: [NSNumber.self], forKey: "position") as? Int16,
            let text = coder.decodeObject(of: [NSString.self], forKey: "text") as? String,
            let dateCreated = coder.decodeObject(of: [NSDate.self], forKey: "datecreated") as? Date
        else {
            return nil
        }
        
        self.id = id
        self.position = position
        self.text = text
        self.dateCreated = dateCreated
    }
    
    public let id: UUID
    var position: Int16
    var text: String
    var dateCreated: Date
    
    init(_ pos: Int16, text: String) {
        self.id = UUID()
        self.position = pos
        self.text = text
        self.dateCreated = Date()
    }
    
    
}

// MARK: NSSecureCoding Conformance
//other than init lol
extension Card: NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    public func encode(with coder: NSCoder) {
        coder.encode(id, forKey: "id")
        coder.encode(position, forKey: "position")
        coder.encode(text, forKey: "text")
        coder.encode(dateCreated, forKey: "datecreated")
    }
}
