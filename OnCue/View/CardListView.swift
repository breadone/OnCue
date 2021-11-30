//
//  CardListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 22/11/21.
//

import SwiftUI
import Defaults

// TODO: implement drag and drop to reorder cards
struct CardListView: View {
    @State private var showingAddScreen: Bool = false
    @State private var alertText: String = ""
    @State private var alertShowing: Bool = false
    @State private var presenting: Bool = false
    
    var project: Project
    let watchMode = Defaults[.watchMode]
    
    let columns = [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.project.cards, id: \.id) { card in
                        SingleCardView(card: card)
                            .padding(.vertical, geo.size.height / 170)
                            .padding(.horizontal, geo.size.width / 45)
                        
                        NavigationLink("", isActive: $presenting) {
                            PresentationViewPhone(project: project)
                                .preferredColorScheme(.dark)
                        }
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
                Button(action: (watchMode ? pushToWatch : {self.presenting.toggle()})) {
                    Image(systemName: "play.fill")
                }
            }
        }
        .sheet(isPresented: $showingAddScreen) {
            NavigationView { AddCardView(projectID: self.project.id) }
        }
        .alert(self.alertText, isPresented: $alertShowing) {
            Button("OK", role: .cancel) { self.alertText = "" }
        }
        
    }
}

extension CardListView {
    func replyHandler(_ d: [String : Any]) {
        self.alertText = d["replyMessage"] as? String ?? "Pushed to Watch"
        self.alertShowing.toggle()
    }
    
    func pushToWatch() {
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(self.project)
        // TODO: implement error handling
        PhoneConnectivityModel.shared.session.sendMessage(["project": data as Any], replyHandler: replyHandler) { error in
            self.alertText = error.localizedDescription
            self.alertShowing.toggle()
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardListView(project: Project.testProject)
        }
    }
}
