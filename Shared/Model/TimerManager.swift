//
//  TimerManager.swift
//  OnCue
//
//  Created by Pradyun Setti on 11/09/22.
//

import SwiftUI

public class TimerManager: ObservableObject {
    @Published public var secondsElapsed: Int = 0
    
    @Published public var formattedTime: String = "00:00"
    
    private var timer: Timer!
    
    init() {
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(update),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc public func update() {
        secondsElapsed += 1
        
        formattedTime = formatSeconds(secondsElapsed)
    }
    
    private func formatSeconds(_ seconds: Int) -> String {
        let minutes = floor(Double(seconds) / 60)
        let rSeconds = Double(seconds) - (minutes * 60)
        
        return String(format: "%02.0f:%02.0f", minutes, rSeconds)
    }
}
