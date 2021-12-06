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
    @Environment(\.managedObjectContext) var context
    @State private var name: String = "New Project"
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                TextField("Name of Project", text: $name)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidBeginEditingNotification)) { obj in
                        if let textField = obj.object as? UITextField {
                            textField.selectedTextRange = textField.textRange(from: textField.beginningOfDocument, to: textField.endOfDocument)
                        }
                    }
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

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddProjectView()
        }
    }
}
