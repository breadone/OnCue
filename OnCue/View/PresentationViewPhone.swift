//
//  PresentationViewPhone.swift
//  OnCue
//
//  Created by Pradyun Setti on 30/11/21.
//

import SwiftUI

struct PresentationViewPhone: View {
    @Environment(\.colorScheme) var cs
    
    let project: Project
    let lightModeColour = Color(white: 0.94, opacity: 1)
    let darkModeColour = Color(white: 0.2, opacity: 0.7)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                TabView {
                    ForEach(project.cards, id: \.id) { card in
                        VStack(alignment: .leading) {
                            Text("\(card.position + 1)")
                                .foregroundColor(cs == .dark ? .white : .black)
                                .font(.system(size: 15, weight: .light, design: .default))
                            Text(card.text)
                                .foregroundColor(cs == .dark ? .white : .black)
                                .font(.system(size: 25, weight: .medium, design: .default))
                        }
                        .padding()
                        .frame(width: geo.size.width * 0.95,
                               height: geo.size.height,// * 0.8,
                               alignment: .topLeading)
                        .background(cs == .dark ? darkModeColour : lightModeColour)
                        .cornerRadius(17)
                    }
                }
                .tabViewStyle(.page)
            }
        }
        .navigationTitle(self.project.name).navigationBarTitleDisplayMode(.inline)
    }
}

struct PresentationViewPhone_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PresentationViewPhone(project: Project.testProject)
//                            .preferredColorScheme(.dark)
        }
    }
}
