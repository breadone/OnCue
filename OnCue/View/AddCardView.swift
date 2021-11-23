//
//  AddCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 24/11/21.
//

import SwiftUI
import Defaults

struct AddCardView: View {
    @Environment(\.dismiss) var dismiss
    @Default(.projects) var projectList
    @State private var text: String = ""
    
    var projectID: UUID
    /*
     the reason i have to do this is because im using structs for the project/cards,
     the struct gets copied over from CardList to AddCard, so the changes are *made* but arent actually saved,
     therefore i have to actually load the list again, and manually edit that list in order for basic saving to work
     */
    var project: Int { // finds the index in the project list that corresponds to the current project
        projectList.firstIndex { $0.id == projectID }!
    }
    
    var lastCard: Int {
        self.projectList[project].cards.endIndex
    }
    
    var body: some View {
        Form {
            Section(header: Text("Text")) {
                TextEditor(text: $text)
            }
        }
        .navigationTitle("Add Card")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    self.projectList[project].cards.append(Card(lastCard, text: text))
                    dismiss.callAsFunction()
                }
            }
        }
    }
}

//struct AddCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCardView()
//    }
//}
