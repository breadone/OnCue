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
    
    private var sortedList: [Project] { // sorts projects by date created (i hope)
        self.projectList.sorted {
            $0.dateCreated > $1.dateCreated
        }
    }
    
    var body: some View {
        NavigationView {
            List(sortedList, id: \.id) { p in
                HStack {
                    Text(p.name)
                    Text(formatDate(p.dateCreated))
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("addTest") {
                        self.projectList.append(Project(name: "test"))
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

extension ProjectListView {
    func formatDate(_ d: Date, format: String = "dd/MM/yy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: d)
    }
}

struct ProjectListView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectListView()
    }
}
