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
    @State private var showingEditScreen: Bool = false
    @State private var alertText: String = ""
    @State private var alertShowing: Bool = false
    @State private var presenting: Bool = false
    @Default(.watchMode) private var watchMode
    
    let model = PhoneConnectivityModel()
    
    @EnvironmentObject var project: Project
    
    let columns = [GridItem(.flexible(minimum: 100)), GridItem(.flexible(minimum: 100))]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(self.project.sortedCards) { card in
                        SingleCardView(card: card)
                            .padding(.vertical, geo.size.height / 170)
                            .padding(.horizontal, geo.size.width / 45)
                            .contextMenu {
                                Button(action: {showingEditScreen.toggle()}) {
                                    Text("Edit")
                                    Image(systemName: "pencil")
                                }
                                Button(action: {deleteCard(card)}) {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                            .sheet(isPresented: $showingEditScreen) {
                                NavigationView {
                                    EditCardView(id: card.id)
                                        .environmentObject(self.project)
                                }
                            }
                    }
                }
                
                NavigationLink(isActive: $presenting) {
                    PresentationViewPhone(project: project)
                } label: {
                    EmptyView()
                }
            }
        }
        .navigationTitle(project.wrappedName)
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
            NavigationView { AddCardView() }
        }
        .alert(self.alertText, isPresented: $alertShowing) {
            Button("OK", role: .cancel) { self.alertText = "" }
        }
        
    }
}

extension CardListView {
    func deleteCard(_ cardToDelete: Card) {
        self.project.cards?.removeAll(where: { $0 == cardToDelete })
        self.project.cards?.forEach { card in
            if card.position > cardToDelete.position {
                self.project.cards?[Int(card.position)].position -= 1
            }
        }
    }
}

extension CardListView {
    func pushToWatch() {
        if !model.session.isPaired {
            self.alertText = "No paired Watch was found, make sure it's on and connected to your iPhone"
            self.alertShowing.toggle()
            return
        }
        
        if model.session.activationState != .activated {
            self.alertText = "WC Session was not activated"
            self.alertShowing.toggle()
            return
        }
        
        if !model.session.isReachable {
            self.alertText = "Could not reach Watch. Make sure it is unlocked, and the OnCue app is open"
            self.alertShowing.toggle()
            return
        }
        
        let encoder = PropertyListEncoder()
        let data = try? encoder.encode(self.project)
        
        model.session.sendMessage(["project": data as Any], replyHandler: nil) { error in
            self.alertText = error.localizedDescription
            self.alertShowing.toggle()
            return
        }
        self.alertText = "Pushed to Watch"
        self.alertShowing.toggle()
    }
}

//struct CardListView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            CardListView(project: oldProject.testProject)
//                .preferredColorScheme(.dark)
//        }
//    }
//}
