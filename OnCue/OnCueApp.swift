//
//  OnCueApp.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

@main
struct OnCueApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
