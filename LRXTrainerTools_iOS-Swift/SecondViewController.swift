//
//  SecondViewController.swift
//  LRXTrainerTools_iOS-Swift
//
//  Created by Bryan Williams on 11/30/15.
//  Copyright © 2015 Bryan Williams. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let stopwatch = Stopwatch()
    var running = false
    var timeLog = [String]()
    let textCellIdentifier = "TextCell"
    
    @IBOutlet var stopwatchLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    @IBAction func toggleStopwatch(stopwatchButton: UIButton) {
        // Press Stop
        if running {
            
            running = false
            stopwatch.stop()
            timeLog.append(stopwatch.elapsedTimeAsString())
            self.tableView.reloadData()
            
            // Change text to "Start"
            stopwatchButton.setTitle("Start", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        }
        // Press Start
        else {
            
            running = true
            stopwatch.reset()
            stopwatch.start()
            
            // Change text to "Stop"
            stopwatchButton.setTitle("Stop", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
       
        
        let row = indexPath.row
        cell.textLabel?.text = String(row + 1)
        cell.detailTextLabel?.text = timeLog[row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLog.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tick() {
        stopwatchLabel.text = stopwatch.elapsedTimeAsString()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopwatch.callback = self.tick
        stopwatchLabel.font = UIFont.monospacedDigitSystemFontOfSize(60, weight: UIFontWeightThin)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

