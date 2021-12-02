//
//  Card.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

@objc(Card)
public class Card: NSObject, Codable, Identifiable, DefaultsSerializable {
    public let id: UUID
    var position: Int
    var text: String
    var dateCreated: Date
    
    init(_ pos: Int, text: String) {
        self.id = UUID()
        self.position = pos
        self.text = text
        self.dateCreated = Date()
    }
}
