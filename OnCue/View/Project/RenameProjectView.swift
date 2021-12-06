//
//  RenameProjectView.swift
//  OnCue
//
//  Created by Pradyun Setti on 6/12/21.
//

import SwiftUI

struct RenameProjectView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var newName: String
    
    var body: some View {
        NavigationView {
            Form {
                TextField("New Name", text: $newName)
            }
            .navigationTitle("Rename Project")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dismiss.callAsFunction()
                    }
                }
            }
        }
    }
}

struct RenameProjectView_Previews: PreviewProvider {
    @State static var test: String = ""
    static var previews: some View {
        RenameProjectView(newName: $test)
    }
}
