//
//  SingleCardView.swift
//  OnCue
//
//  Created by Pradyun Setti on 23/11/21.
//

import SwiftUI

struct SingleCardView: View {
    let card: oldCard
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(card.position + 1)")
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .heavy, design: .default))
            Text(card.text)
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium, design: .default))
        }
        .padding()
        .frame(minWidth: 100, maxWidth: 200, minHeight: 100, maxHeight: 250, alignment: .topLeading)
        .background(Color("AccentColor"))
        .cornerRadius(17)
        .shadow(color: Color("AccentColor"), radius: 6, x: 0, y: 0)
    }
}

//struct SingleCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        SingleCardView()
//    }
//}
