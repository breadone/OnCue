//
//  PresentationView.swift
//  WatchPresenter WatchKit Extension
//
//  Created by Pradyun Setti on 19/11/21.
//

import SwiftUI

struct PresentationView: View {
    @StateObject var model = WatchConnectivityModel()
    private let noProjCard = Card(0, text: "Push some cards to your Watch from the iPhone app")
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                TabView {
                    ForEach(model.project?.wrappedCards ?? [noProjCard], id: \.id) { card in
                        VStack(alignment: .leading) {
                            Text("\(card.position + 1)")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                            Text(card.text)
                        }
                        .padding(.top, 3) // apple watch 3 reasons
                        .frame(width: geometry.size.width,
                               height: geometry.size.height,
                               alignment: .topLeading)
                    }
                }
                .navigationTitle(model.project?.wrappedName ?? "No Project")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentationView()
    }
}
