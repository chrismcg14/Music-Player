//
//  SecondViewController.swift
//  Music Player
//
//  Created by Christopher McCarroll-Gilbert on 7/7/20.
//  Copyright © 2020 Christopher McCarroll-Gilbert. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBAction func play(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying == false
        {
                   audioPlayer.play()
        }
               
    }
    
    @IBAction func pause(_ sender: Any) {
        if audioStuffed == true && audioPlayer.isPlaying
        {
        
                audioPlayer.pause()
            
        }
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        if thisSong < songs.count-1 && audioStuffed == true
        {
            playThis(thisOne: songs[thisSong+1])
            thisSong += 1
            label.text = songs[thisSong]
        }
        else{
            //MCG - logic is off here, figure out how to reset the array
            /*
            thisSong = 0
            playThis(thisOne: songs[thisSong])
            thisSong += 1*/
        }
    }
    
    @IBAction func slider(_ sender: Any) {
        if audioStuffed == true
        {
            audioPlayer.volume = (sender as AnyObject).value
        }
    }
    @IBAction func prev(_ sender: Any) {
        if thisSong != 0 && audioStuffed == true
        {
        playThis(thisOne: songs[thisSong - 1])
            thisSong -= 1
            label.text = songs[thisSong]
            
        }
        else
        {
            
        }
    }
    func playThis(thisOne: String)
    {
        do
               {
                   let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
                   try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
                   
                   audioPlayer.play()
               }
               catch
               {
                   print("ERROR")
               }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = songs[thisSong]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }

    
    
}

