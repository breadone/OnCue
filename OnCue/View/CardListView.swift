//
//  CardListView.swift
//  OnCue
//
//  Created by Pradyun Setti on 22/11/21.
//

import SwiftUI
// TODO: implement drag and drop cards
struct CardListView: View {
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
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CardListView(project: Project.testProject)
        }
    }
}
