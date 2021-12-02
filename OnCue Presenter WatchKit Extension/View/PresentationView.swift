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
            GeometryReader { geometry in
                TabView {
                    // FORCE UNWRAP WILL FAIL ITS JUST A PLACEHOLDER
                    ForEach(model.project!.wrappedCards, id: \.id) { card in
                        Text(card.text)
                            .padding(.top, 3) // apple watch 3 reasons
                            .frame(width: geometry.size.width,
                                   height: geometry.size.height,
                                   alignment: .topLeading)
                    }
                }
                .navigationTitle(model.project!.wrappedName)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
