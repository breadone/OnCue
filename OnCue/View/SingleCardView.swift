//
//  SingleCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 23/11/21.
//

import SwiftUI

struct SingleCardView: View {
    let card: Card
    var body: some View {
        Text(card.text)
            .padding()
            .foregroundColor(.white)
            .frame(width: 350, height: 200, alignment: .topLeading)
            .background(Color("AccentColor"))
            .cornerRadius(17)
            .shadow(color: Color.accentColor, radius: 6, x: 0, y: 0)
    }
}

//struct SingleCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleCardView()
//    }
//}
