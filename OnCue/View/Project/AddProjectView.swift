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
                    self.projectList.append(self.createProject())
                    dismiss.callAsFunction()
                }
            }
        }
    }
}

extension AddProjectView {
    func createProject() -> oldProject {
        return oldProject(name: self.name)
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProjectView()
        }
    }
}
