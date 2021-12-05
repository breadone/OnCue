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
    @State private var newCardText: String = ""
    @State private var alertText: String = "no error"
    @State private var alertShow = false
    
    @EnvironmentObject var project: Project
    
    var lastCard: Int16 {
        Int16(self.project.wrappedCards.endIndex)
    }
    
    var body: some View {
        GeometryReader { geo in
            Form {
                Section(header: Text("Text")) {
                    TextEditor(text: $newCardText)
                        .frame(minHeight: geo.size.height * 0.75)
                }
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.project.cards?.append(Card(lastCard, text: newCardText))
                        do {
                            try context.save()
                        } catch {
                            self.alertText = error.localizedDescription
                            self.alertShow.toggle()
                        }
                        dismiss.callAsFunction()
                    }
                }
            }
            .alert(self.alertText, isPresented: $alertShow) {
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
