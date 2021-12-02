//
//  DefaultsConfig.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import Foundation
import Defaults

extension Defaults.Keys {
    static let projects = Key<[oldProject]>("projects", default: [])
    static let watchMode = Key<Bool>("watchMode", default: false)
    
}
