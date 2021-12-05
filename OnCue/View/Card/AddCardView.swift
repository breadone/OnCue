//
//  AddCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 24/11/21.
//

import SwiftUI
import Defaults

struct AddCardView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @Default(.projects) var projectList
    @State private var text: String = ""
    @State private var alerttext: String = "no error"
    @State private var alertshow = false
    
    @EnvironmentObject var project: Project
    
    var lastCard: Int16 {
        Int16(self.project.wrappedCards.endIndex)
    }
    
    var body: some View {
        GeometryReader { geo in
            Form {
                Section(header: Text("Text")) {
                    TextEditor(text: $text)
                        .frame(minHeight: geo.size.height * 0.75)
                }
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.project.cards?.append(Card(lastCard, text: text))
                        do {
                            try context.save()
                        } catch {
                            self.alerttext = error.localizedDescription
                            self.alertshow.toggle()
                        }
                        dismiss.callAsFunction()
                    }
                }
            }
            .alert(self.alerttext, isPresented: $alertshow) {
                Button("OK", role: .cancel) {}
            }
        }
    }
}

//struct AddCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddCardView(projectID: oldProject.testProject.id)
//        }
//    }
//}
