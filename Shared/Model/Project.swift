//
//  Project.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

struct Project: Codable, DefaultsSerializable {
    let id: UUID
    var name: String
    var cards: [Card]
    var dateCreated: Date
    
    init(name: String, cards: [Card] = []) {
        self.id = UUID()
        self.name = name
        self.cards = cards
        self.dateCreated = Date()
    }
}
