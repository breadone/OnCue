//
//  ProjectCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct ProjectCardView: View {
    var project: Project
    var bgColour: Color = .accentColor
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.project.wrappedName)
                    .font(.system(size: 20, weight: .heavy, design: .default))
                    .foregroundColor(.white)
                Spacer()
                Text("\(self.project.wrappedCards.count) \(self.project.wrappedCards.count != 1 ? "Cards" : "Card")")
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.white)
            }
            HStack {
                if self.project.wrappedCards.capacity <= 5 {
                    ForEach(self.project.wrappedCards, id: \.id) { card in
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
                        Text(self.project.wrappedCards[i].text)
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
