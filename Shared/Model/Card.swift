//
//  Card.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

struct Card: Codable, DefaultsSerializable {
    var position: Int
    var text: String
    var dateCreated: Date
    
    init(_ pos: Int, text: String) {
        self.position = pos
        self.text = text
        self.dateCreated = Date()
    }
}
