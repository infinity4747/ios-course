//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation //Audio and video

class ViewController: UIViewController {
//    let softTime = 5
//    let mediumTime = 7
//    let hardTime = 12
    
    @IBOutlet weak var messageView: UILabel!
      
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTime = ["Soft": 5, "Medium":420, "Hard":720 ]
    var player : AVAudioPlayer!
    // var seconds = 60 - This variable will hold a starting value of seconds. It could be any amount above 0.
    var totalSecond : Float = 0
    var secondPassed : Float = 0
    var timer = Timer() //A timer that fires after a certain time interval has elapsed, sending a specified message to a target object.
   
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        if url != nil {
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
        
        
    }
       
    @objc func updateTimer() {
        // seconds -= 1 -This will decrement(count down)the seconds.
        if (secondPassed <= totalSecond){
            secondPassed += 1
            progressBar.progress = Float(secondPassed / totalSecond)
        }
        else{
            timer.invalidate()
            messageView.text = "Done"
            playSound()
        }
}

    @IBAction func hardnessPressed(_ sender: UIButton) {
        timer.invalidate() // to stop timer
        print(eggTime[sender.currentTitle!]!)
        totalSecond = Float(eggTime[sender.currentTitle!]!)
        progressBar.progress = 0.0
        secondPassed = 0
        messageView.text = sender.currentTitle!
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
        // The interval is measured seconds so for it to perform like a standard clock we should set this argument to 1.
        // timeInterval: 1
               
        // The following should work well for specifying which method to call at the interval.
        //  selector: (#selector(ViewController.updateTimer))
               
        //repeats should be set to true, because we want the timer to automatically call itself again to keep running.
           
        
       
//        switch sender.currentTitle {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("error")
//        }
    }
    
}
