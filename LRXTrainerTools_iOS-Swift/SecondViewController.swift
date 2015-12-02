//
//  SecondViewController.swift
//  LRXTrainerTools_iOS-Swift
//
//  Created by Bryan Williams on 11/30/15.
//  Copyright © 2015 Bryan Williams. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let stopwatch = Stopwatch()
    var running = false
    var timeLog = [String]()
    let textCellIdentifier = "TextCell"
    
    @IBOutlet var stopwatchLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var stopwatchButton: UIButton!
    
    @IBAction func toggleStopwatch(stopwatchButton: UIButton) {
        // Stop
        if running {
            
            running = false
            stopwatch.stop()
            timeLog.append(stopwatch.elapsedTimeAsString())
            tableView.reloadData()
            
            // Change text to "Start"
            stopwatchButton.setTitle("Start", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.purpleColor(), forState: .Normal)
        }
        // Start
        else {
            
            running = true
            stopwatch.reset()
            stopwatch.start()
            
            // Change text to "Stop"
            stopwatchButton.setTitle("Stop", forState: .Normal)
            stopwatchButton.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
    }
    
    @IBAction func clearAll(sender: UIButton) {
        timeLog.removeAll()
        tableView.reloadData()
    }
    
    @IBAction func clearLast(sender: UIButton) {
        if timeLog.count > 0 {
            timeLog.removeLast()
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        
        let row = indexPath.row
        cell.separatorInset = UIEdgeInsetsZero
        cell.layoutMargins = UIEdgeInsetsZero
        cell.preservesSuperviewLayoutMargins = false
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
    
    func loadStyle() {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        stopwatch.callback = self.tick
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.separatorInset = UIEdgeInsetsZero
        stopwatchLabel.font = UIFont.monospacedDigitSystemFontOfSize(60, weight: UIFontWeightThin)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

