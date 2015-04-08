//
//  InterfaceController.swift
//  MoodTrack WatchKit Extension
//
//  Created by Panaswift on 4/6/15.
//  Copyright (c) 2015 Panaswift. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {
    let moodIndex:Int!
    
    init(moodIndex:Int){
        self.moodIndex = moodIndex
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var moodImage: WKInterfaceImage!
    var currentMood:Int = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func moodSliderChanged(value: Float) {
        
        currentMood = Int(value)
        println("Current mood: \(currentMood)")
        self.updateMoodImage()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        
        if segueIdentifier == "RecordMoodSegue" {
            return MoodContextData(moodIndex: currentMood)
        }
        return nil
    }
    
    func updateMoodImage(){
        if currentMood < 0 || currentMood > 4 {
            return
        }
        
        moodImage.setImageNamed("range\(currentMood)")
    }
    
    @IBAction func helpButtonTapped() {
        presentControllerWithName("HelpController", context: nil)
    }
}
