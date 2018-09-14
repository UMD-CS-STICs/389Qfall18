//
//  ViewController.swift
//  Xylophone
//
//  Created by Travis Ho on 9/14/18.
//  Copyright © 2018 Travis Ho. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playSoundFor(tag: Int) {
        guard let url = Bundle.main.url(forResource: "note\(tag)", withExtension: "wav") else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
  

}

