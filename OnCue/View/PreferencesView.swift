//
//  PreferencesView.swift
//  OnCue
//
//  Created by Pradyun Setti on 29/11/21.
//

import SwiftUI
import Defaults

struct PreferencesView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header: Text("General")) {
                Defaults.Toggle("Present on Watch", key: .watchMode)
            }
            
            Section(header: Text("Support Me")) {
                PurchaseButton("🍎 Fresh Fruit", 0.99)
                PurchaseButton("☕️ Cappuchino", 4.99)
                PurchaseButton("🍱 Lunch", 19.99)
            }
            
        }
        .navigationTitle("Preferences")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    dismiss.callAsFunction()
                }
            }
        }
    }
}

fileprivate struct PurchaseButton: View {
    let mainText: String, price: Double
    
    init(_ mt: String, _ p: Double) {
        self.mainText = mt
        self.price = p
    }
    
    var body: some View {
        Button {
            purchase()
        } label: {
            HStack {
                Text(mainText)
                Spacer()
                Text(String(format: "$%.2f", price))
            }
        }
    }
    
    func purchase() {
        // to come
    }
    
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PreferencesView()
        }
    }
}
