//
//  FirstViewController.swift
//  LRXTrainerTools_iOS-Swift
//
//  Created by Bryan Williams on 11/30/15.
//  Copyright © 2015 Bryan Williams. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    var metronomeTimer: NSTimer!
    var metronomeIsOn = false
    var metronomeSoundPlayer: AVAudioPlayer!
    
    @IBOutlet weak var tempoStepper: UIStepper!
    @IBOutlet weak var metronomeButton: UIButton!
    
    var tempo: NSTimeInterval = 60 {
        didSet {
            tempoLabel.text = String(format: "%.0f", tempo)
            tempoStepper.value = Double(tempo)
        }
    }

    @IBOutlet var tempoLabel: UILabel!
    
    @IBAction func tempoChanged(tempoStepper: UIStepper) {
        tempo = tempoStepper.value
    }
    
    @IBAction func toggleMetronome(metronomeButton: UIButton) {
        
        // If the metronome is currently on, stop the metronome and change
        if metronomeIsOn {
            // Mark the metronome as off.
            metronomeIsOn = false
            
            // Stop the metronome.
            metronomeTimer?.invalidate()
            
            // Change the toggle metronome button's to "Play"
            metronomeButton.setTitle("Play", forState: .Normal)
            metronomeButton.setTitleColor(UIColor.greenColor(), forState: .Normal)
            
            // Enable the metronome stepper.
            tempoStepper.enabled = true
            tempoStepper.tintColor = UIColor.greenColor()
        }
            
            // If the metronome is currently off, start the metronome and change
            
        else {
            // Mark the metronome as on.
            metronomeIsOn = true
            
            // Start the metronome.
            let metronomeTimeInterval:NSTimeInterval = 60.0 / tempo
            metronomeTimer = NSTimer.scheduledTimerWithTimeInterval(metronomeTimeInterval, target: self, selector: Selector("playMetronomeSound"), userInfo: nil, repeats: true)
            metronomeTimer?.fire()
            
            // Change the toggle metronome button's to "Stop"
            metronomeButton.setTitle("Stop", forState: .Normal)
            metronomeButton.setTitleColor(UIColor.redColor(), forState: .Normal)
            
            // Disable the metronome stepper.
            tempoStepper.enabled = false
            tempoStepper.tintColor = UIColor.lightGrayColor()
        }
    }
    
    func playMetronomeSound() {
        metronomeSoundPlayer.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tempo = 120
        tempoLabel.font = UIFont.monospacedDigitSystemFontOfSize(80, weight: UIFontWeightThin)
        tempoStepper.tintColor = UIColor.greenColor()
        
        // Initialize the sound player
        let metronomeSoundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("metronomeClick", ofType: "mp3")!)
        metronomeSoundPlayer = try? AVAudioPlayer(contentsOfURL: metronomeSoundURL)
        metronomeSoundPlayer.prepareToPlay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}