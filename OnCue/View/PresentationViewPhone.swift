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
    let darkModeColour = Color(white: 0.2, opacity: 0.9)
    
    @State private var titleText: String = ""
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                TabView {
                    ForEach(project.cards, id: \.id) { card in
                        Text(card.text)
                            .font(.system(size: 25, weight: .medium, design: .default))
                            .padding()
                            .frame(width: geo.size.width * 0.95,
                                   height: geo.size.height,// * 0.8,
                                   alignment: .topLeading)
                            .background(darkModeColour)
                            .cornerRadius(17)
                            .onAppear {
                                self.titleText = "\(project.name) (\(card.position + 1)/\(project.cards.capacity))"
                            }
                    }
                }
                .tabViewStyle(.page)
            }
        }
        .navigationTitle(self.titleText).navigationBarTitleDisplayMode(.inline)
    }
}

struct PresentationViewPhone_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PresentationViewPhone(project: Project.testProject)
                .preferredColorScheme(.dark)
        }
    }
}
