//
//  FirstViewController.swift
//  Music Player
//
//  Created by Christopher McCarroll-Gilbert on 7/7/20.
//  Copyright © 2020 Christopher McCarroll-Gilbert. All rights reserved.
//

import UIKit
import AVFoundation


var songs:[String] = []
var audioPlayer = AVAudioPlayer()
var thisSong = 0
var audioStuffed = false

var player:AVPlayer?
var playerItem:AVPlayerItem?
var playerLayer:AVPlayerLayer?
var playButton:UIButton?
var nextButton:UIButton?
var prevButton:UIButton?
var upButton:UIButton?
var downButton:UIButton?
var stopButton:UIButton?
var durLabel:UILabel = UILabel();
var curLabel:UILabel = UILabel();
var songLabel:UILabel = UILabel();







class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var myTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        do
        {
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
            thisSong = indexPath.row
            audioStuffed = true
        }
        catch
        {
            print("ERROR")
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gettingSongName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //dispose of any resources that can be recreated
    }
    //
    func gettingSongName(){
        let folderURL = URL(fileURLWithPath:  Bundle.main.resourcePath!)
        //do something
        do{
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for song in songPath{
                //take a song
                var mySong = song.absoluteString
                //make sure that it is a song
                if mySong.contains(".mp3")
                {
                    let findString = mySong.components(separatedBy: "/")
                    mySong = findString[findString.count-1]
                    mySong = mySong.replacingOccurrences(of: "%20", with: " ")
                    mySong = mySong.replacingOccurrences(of: ".mp3", with: "")
                    songs.append(mySong)
                }
            }
            myTableView.reloadData()
        }
        
        catch{
            
        }
        
    }


}

