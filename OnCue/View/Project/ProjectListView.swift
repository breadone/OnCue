//
//  ProjectListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI
import CoreData

struct ProjectListView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var showingAddScreen = false
    @State private var showingPrefsScreen = false
    
    @State private var showingRenameScreen = false
    @State private var newName: String = ""
    @State private var projectToRename: Project?
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dateCreated, order: .reverse)])
    var projects: FetchedResults<Project>
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    ForEach(projects, id: \.id) { proj in
                        NavigationLink(destination: CardListView().environmentObject(proj)) {
                            ProjectCardView().environmentObject(proj)
                        }
                        .contextMenu {
                            Button {
                                self.projectToRename = proj
                                self.showingRenameScreen.toggle()
                            } label: {
                                Text("Rename")
                                Image(systemName: "pencil")
                            }
                            
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
            .sheet(isPresented: $showingRenameScreen, onDismiss: renameProject) {
                RenameProjectView(newName: $newName)
            }
        }
    }
}

extension ProjectListView {
    func removeProject(_ project: Project) {
        context.delete(project)
        try? context.save()
    }
    
    func renameProject() {
        // FU bc its always gonna be set when this is called
        self.projectToRename!.name = self.newName
        try? context.save()
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    static var previews: some View {
        ProjectListView().environment(\.managedObjectContext, DataController.shared.container.viewContext)
    }
}
