//
//  Project.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

struct oldProject: Codable, Identifiable, DefaultsSerializable {
    let id: UUID
    var name: String
    var cards: [oldCard]
    var dateCreated: Date
    
    init(name: String, cards: [oldCard] = []) {
        self.id = UUID()
        self.name = name
        self.cards = cards
        self.dateCreated = Date()
    }
}

extension oldProject {
    static let testProject = oldProject(name: "Test Project", cards: [oldCard(0, text: "card one"), oldCard(1, text: "card two")])
    
    static let defaultWatchProject = oldProject(name: "No Project", cards: [oldCard(0, text: "Push some cards to your Watch from the iPhone app")])
    
    static let errorProject = oldProject(name: "Error", cards: [oldCard(0, text: "An error occured.")])
}
