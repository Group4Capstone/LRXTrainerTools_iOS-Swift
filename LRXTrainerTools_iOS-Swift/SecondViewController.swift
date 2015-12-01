//
//  SecondViewController.swift
//  LRXTrainerTools_iOS-Swift
//
//  Created by Bryan Williams on 11/30/15.
//  Copyright © 2015 Bryan Williams. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    var running = false
    var logCount = 0
    //var timer = NSTimer()
    //var startTime = NSTimeInterval()
    
    let stopwatch = Stopwatch()
    
    @IBOutlet var stopwatchLabel: UILabel!
    
    @IBAction func toggleStopwatch(stopwatchButton: UIButton) {
        if running {
            running = false
            stopwatch.stop()
            
            //timer.invalidate()
            
            // Change to "Start"
            stopwatchButton.setTitle("Start", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        }
        else {
            running = true
            stopwatch.reset()
            stopwatch.start()
            
            
            /*
            let aSelector : Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate()
            */
            
            // Change to "Stop"
            stopwatchButton.setTitle("Stop", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
    }
    
    func tick() {
        stopwatchLabel.text = stopwatch.elapsedTimeAsString()
    }
    
    
    /*
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time.
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the minutes in elapsed time.
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time.
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed.
        let fraction = UInt8(elapsedTime * 100)
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        //concatenate minuets, seconds and milliseconds as assign it to the UILabel
        stopwatchLabel.text = "\(strMinutes):\(strSeconds).\(strFraction)"
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopwatch.callback = self.tick
        stopwatchLabel.font = UIFont.monospacedDigitSystemFontOfSize(60, weight: UIFontWeightThin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

