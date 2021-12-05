//
//  ProjectListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI
import Defaults

struct ProjectListView: View {
    @Environment(\.managedObjectContext) var context
    @State private var showingAddScreen = false
    @State private var showingPrefsScreen = false
    
    @Default(.projects) private var projectList
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dateCreated, order: .reverse)]) var projects: FetchedResults<Project>
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    ForEach(projects, id: \.id) { proj in
                        NavigationLink(destination: CardListView().environmentObject(proj)) {
                            ProjectCardView(project: proj)
                        }
                        .contextMenu {
                            Button(action: {self.removeProject(proj)}) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                        .padding(.vertical, geo.size.height / 170)
                        .padding(.horizontal, geo.size.width / 30)
                    }
                }
            }
            .navigationTitle("Projects")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button(action: {self.showingPrefsScreen.toggle()}) {
                        Image(systemName: "gearshape.fill")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {self.showingAddScreen.toggle()}) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen) {
                NavigationView { AddProjectView() }
            }
            .sheet(isPresented: $showingPrefsScreen) {
                NavigationView { PreferencesView() }
            }
        }
    }
}

extension ProjectListView {
    func removeProject(_ project: Project) {
        context.delete(project)
        try? context.save()
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
