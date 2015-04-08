//
//  MoodDetailsController.swift
//  MoodTrack
//
//  Created by Panaswift on 4/6/15.
//  Copyright (c) 2015 Panaswift. All rights reserved.
//

import Foundation
import WatchKit

class MoodDetailsController: WKInterfaceController {
    
    let moodNames = ["Ok","Not Bad","Hmmm","Anger","Rawr"]
    var currentMood = 0
    
    @IBOutlet weak var moodImage: WKInterfaceImage!
    @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
    @IBOutlet weak var moodDescriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var moodAdviceLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
        }
    }
    
    override func willActivate() {
        super.willActivate()
        
        moodImage.setImageNamed("range\(currentMood)")
        let moodName = moodNames[currentMood]
        moodNameLabel.setText(moodName)
        moodDescriptionLabel.setText("You are feeling So \(moodName), eh?")
    }
}
