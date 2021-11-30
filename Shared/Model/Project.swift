//
//  Project.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

struct Project: Codable, Identifiable, DefaultsSerializable {
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

extension Project {
    static let testProject = Project(name: "Test Project", cards: [Card(0, text: "card one"), Card(1, text: "card two")])
    
    static let defaultWatchProject = Project(name: "No Project", cards: [Card(0, text: "Push some cards to your Watch from the iPhone app")])
    
    static let errorProject = Project(name: "Error", cards: [Card(0, text: "An error occured.")])
}
