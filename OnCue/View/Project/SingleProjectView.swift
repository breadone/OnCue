//
//  ProjectCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct ProjectCardView: View {
    var project: oldProject = oldProject.testProject
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
                if self.project.cards.capacity <= 5 {
                    ForEach(self.project.cards, id: \.id) { card in
                        Text(card.text)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width: 65, height: 55, alignment: .topLeading)
                            .background(Color(white: 1, opacity: 0.25))
                            .cornerRadius(11)
                    }
                } else {
                    ForEach(0..<4) { i in
                        Text(self.project.cards[i].text)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .padding(5)
                            .frame(width: 65, height: 55, alignment: .topLeading)
                            .background(Color(white: 1, opacity: 0.25))
                            .cornerRadius(11)
                    }
                    Image(systemName: "ellipsis").foregroundColor(.white)
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
