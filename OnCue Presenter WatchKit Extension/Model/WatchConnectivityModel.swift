//
//  WatchConnectivityModel.swift
//  OnCue Presenter WatchKit Extension
//
//  Created by Pradyun Setti on 24/11/21.
//

import Foundation
import WatchConnectivity

class WatchConnectivityModel: NSObject, WCSessionDelegate, ObservableObject {
    var session: WCSession
    
    @Published var project = oldProject.defaultWatchProject
    var projectData = Data()
    let decoder = PropertyListDecoder()
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String: Any]) {
        DispatchQueue.main.async { [self] in
            self.projectData = (message["project"] as? Data ?? Data())
            
            do {
                self.project = try decoder.decode(oldProject.self, from: projectData)
            } catch {
                self.project = oldProject.errorProject
            }
        }
    }
}
