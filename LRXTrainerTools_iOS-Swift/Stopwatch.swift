//
//  Stopwatch.swift
//  LRXTrainerTools_iOS-Swift
//
//  Created by Bryan Williams on 11/30/15.
//  Copyright © 2015 Bryan Williams. All rights reserved.
//

import Foundation
import QuartzCore

class Stopwatch: NSObject {
    private var displayLink: CADisplayLink!
    private let formatter = NSDateFormatter()
    
    var callback: (() -> Void)?
    var elapsedTime: CFTimeInterval!
    
    override init() {
        super.init()
        
        self.displayLink = CADisplayLink(target: self, selector: "tick:")
        displayLink.paused = true
        displayLink.addToRunLoop(NSRunLoop.mainRunLoop(), forMode: NSRunLoopCommonModes)
        
        self.elapsedTime = 0.0
        
        formatter.dateFormat = "mm:ss.SS"
    }
    
    convenience init(withCallback callback: () -> Void) {
        self.init()
        self.callback = callback
    }
    
    deinit {
        displayLink.invalidate()
    }
    
    func tick(sender: CADisplayLink) {
        elapsedTime = elapsedTime + displayLink.duration
        callback?()
    }
    
    func start() {
        displayLink.paused = false
    }
    
    func stop() {
        displayLink.paused = true
    }
    
    func reset() {
        displayLink.paused = true
        elapsedTime = 0.0
        callback?()
    }
    
    func elapsedTimeAsString() -> String {
        return formatter.stringFromDate(NSDate(timeIntervalSinceReferenceDate:elapsedTime))
    }
}