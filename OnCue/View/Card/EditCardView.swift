//
//  EditCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 7/12/21.
//

import SwiftUI

struct EditCardView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var project: Project
    
    let cardID: UUID
    var cardPos: Int16 = 0
    @State private var cardText: String
    
    init(id: UUID) { // finds the card matching the id thats passed into it
        self.cardID = id
        self._cardText = State(initialValue: "")

        let card = project.wrappedCards.first {
            $0.id == id
        }
        
        self.cardPos = card!.position
        self._cardText = State(initialValue: card!.text)
    }
    
    var body: some View {
        GeometryReader { geo in
            Form {
                Section(header: Text("Text")) {
                    TextEditor(text: $cardText)
                        .frame(minHeight: geo.size.height * 0.75)
                }
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.project.cards?.removeAll {
                            $0.id == cardID
                        }
                        self.project.cards?.append(Card(cardPos, text: cardText))
                        dismiss.callAsFunction()
                    }
                }
            }
        }
    }
}

//struct EditCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCardView()
//    }
//}
