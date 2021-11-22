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
                        NavigationLink(destination: CardListView(project: proj)) {
                            ProjectCardView(project: proj)
//                                .frame(width: geo.size.width, height: geo.size.height / 7)
                        }
                        .contextMenu {
                            Button(action: {self.removeProject(proj.id)}) {
                                Text("Delete")
                                Image(systemName: "trash")
                            }
                        }
                        .padding(.vertical, geo.size.height / 170)
                        .padding(.horizontal, geo.size.width / 23)
                    }
                }
            }
                .navigationTitle("Projects")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("add test") {
                            self.projectList.append(Project.testProject)
                        }
                        Button("add cards") {
                            self.projectList[0].cards.append(Card(2, text: "wha"))
                        }
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("clear tests") {
                            self.projectList = []
                        }
                    }
                }
//            }
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
