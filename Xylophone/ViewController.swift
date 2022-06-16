//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // Audio Visio foundation allows interaction with different parts of the hardware

class ViewController: UIViewController {
   
    //declare variable for the sound
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            print("Start")
            
            //Brings sender's opacity back up to fully opaque.
              sender.alpha = 1.0
            print("End")
          }
        
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav") //location of the C file with extension of wav
        player = try! AVAudioPlayer(contentsOf: url!) //The url file is put inside this player
        player.play() // tell the player to play the sound
                
    }
}
