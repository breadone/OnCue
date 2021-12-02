//
//  AddProjectView.swift
//  OnCue
//
//  Created by Pradyun Setti on 23/11/21.
//

import SwiftUI
import Defaults

struct AddProjectView: View {
    @Environment(\.dismiss) var dismiss
    @Default(.projects) private var projectList: [oldProject]
    @Environment(\.managedObjectContext) var context
    @State private var name: String = "New Project"
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name of Project", text: $name)
            }
        }
        .navigationTitle("Create Project")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    Project.add(context: context, name: name)
                    dismiss.callAsFunction()
                }
            }
        }
    }
}

extension AddProjectView {
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProjectView()
        }
    }
}
