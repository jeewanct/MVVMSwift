//
//  ShowTimer.swift
//  Project
//
//  Created by jeevan tiwari on 7/17/21.
//

import Foundation
class ShowTimer: NSObject{
    
    var timer: Timer?
    var timeCount: Int = 0
    var timeInterval: TimeInterval = 0
    var currentTime: IntCompletion?
    
    init(_ timeInterval: TimeInterval = 0) {
        super.init()
        self.timeInterval = timeInterval
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    @objc func countDown(){
        timeCount += 1
        currentTime?(timeCount)
    }
}
