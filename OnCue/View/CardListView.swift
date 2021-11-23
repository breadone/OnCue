//
//  CardListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 22/11/21.
//

import SwiftUI
// TODO: implement drag and drop to reorder cards
struct CardListView: View {
    @State private var showingAddScreen = false
    var project: Project
    
    let columns = [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.project.cards, id: \.id) { card in
                        SingleCardView(card: card)
                            .padding(.vertical, geo.size.height / 170)
                            .padding(.horizontal, geo.size.width / 45)
                    }
                }
            }
        }
        .navigationTitle(project.name)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: {self.showingAddScreen.toggle()}) {
                    Image(systemName: "plus")
                }
                Button(action: {}) {
                    Image(systemName: "play.fill")
                }
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            NavigationView { AddCardView(projectID: self.project.id) }
        }
    }
}

extension CardListView {
    func pushToWatch() {
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(self.project)
        // TODO: implement error handling
        PhoneConnectivity.shared.session.sendMessage(["project": data as Any], replyHandler: nil)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardListView(project: Project.testProject)
        }
    }
}
