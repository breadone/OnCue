//
//  PresentationView.swift
//  WatchPresenter WatchKit Extension
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct PresentationView: View {
    @StateObject var model = WatchConnectivityModel()
    
    var body: some View {
        NavigationView {
            TabView {
                ForEach(model.project.cards, id: \.id) { card in
                    Text(card.text)
                        .padding()
                }
            }
            .navigationTitle(model.project.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
