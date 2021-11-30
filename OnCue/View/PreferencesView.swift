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

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PreferencesView()
        }
    }
}
