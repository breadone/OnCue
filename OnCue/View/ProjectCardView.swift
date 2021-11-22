//
//  ProjectCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project = Project(name: "sample project")
    var bgColour: Color = .accentColor
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.project.name)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                Spacer()
                Text("\(self.project.cards.count) \(self.project.cards.count != 1 ? "Cards" : "Card")")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            HStack {
                ForEach(self.project.cards, id: \.id) { card in
                    Text(card.text)
                        .padding()
                        .background(Color(white: 1, opacity: 0.25))
                        .cornerRadius(13)
                }
            }
        }
        .padding()
        .background(bgColour)
        .cornerRadius(17)
        .shadow(color: bgColour, radius: 6, x: 0, y: 0)
    }
}

//struct ProjectCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectCardView()
//    }
//}
