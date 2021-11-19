//
//  ProjectCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project = Project(name: "sample project")
    var width: Double = 320
    var height: Double = 150
    var bgColour: Color = .accentColor
    var grad = Gradient(colors: [.accentColor, .white])
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.project.name).foregroundColor(.white)
                Spacer()
                Text("\(self.project.cards.count) \(self.project.cards.count != 1 ? "Cards" : "Card")").foregroundColor(.white)
            }
            ScrollView(.horizontal) {
                List(self.project.cards, id: \.id) { card in
                    Text(card.text)
                        .padding()
                        .background(Color.red)
                }
            }
        }
        .padding()
        .frame(width: self.width, height: self.height, alignment: .center)
        .background(bgColour)
        .cornerRadius(17)
        .shadow(color: bgColour, radius: 6, x: 0, y: 0)
    }
}

struct ProjectCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCardView()
    }
}
