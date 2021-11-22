//
//  ProjectListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI
import Defaults

struct ProjectListView: View {
    @Default(.projects) private var projectList
    
    private var sortedList: [Project] { // sorts projects by date created
        self.projectList.sorted {
            $0.dateCreated > $1.dateCreated
        }
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    ForEach(sortedList, id: \.id) { proj in
                        ProjectCardView(project: proj)
                            .frame(height: geo.size.height / 5)
                            .padding(.vertical, 5)
                            .padding(.horizontal, geo.size.width / 23)
                            .contextMenu {
                                Button(action: {self.removeProject(proj.id)}) {
                                    Text("Delete")
                                    Image(systemName: "trash")
                                }
                            }
                    }
                }
                .navigationTitle("Projects")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("add test") {
                            self.projectList.append(Project(name: "sample project",
                                                            cards: [Card(0, text: "card one"), Card(1, text: "card two")]))
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("clear tests") {
                            self.projectList = []
                        }
                    }
            }
            }
        }
    }
}

extension ProjectListView {
    func formatDate(_ d: Date, format: String = "dd/MM/yy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: d)
    }
    
    func removeProject(_ id: UUID) {
        self.projectList.removeAll {
            $0.id == id
        }
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
