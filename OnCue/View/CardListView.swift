//
//  CardListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 22/11/21.
//

import SwiftUI

struct CardListView: View {
    var project: Project
    
    var body: some View {
        ScrollView {
            ForEach(self.project.cards, id: \.id) { card in
                SingleCardView(card: card)
            }
        }
        .navigationTitle(project.name)
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardListView(project: Project.testProject)
        }
    }
}
