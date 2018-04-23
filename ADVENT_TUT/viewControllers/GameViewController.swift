//
//  GameViewController.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

let setMusicVolumeNotificationName = Notification.Name("setMusicVolumeNotificationName")

class GameViewController: UIViewController {
    
    let skView: SKView = {
        let view = SKView()
        return view
    }()
    
    //audioplayer for bg music////
    lazy var backGroundMusic: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: kBackgroundMusic, withExtension: kBackgroundExt) else {
            return nil
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.numberOfLoops = -1
            return player
        } catch {
            return nil
        }
    }()
    //audioplayer for bg music///

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNotificationObservers()
        
        
        view.addSubview(skView)
        skView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        
        let menu = MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        menu.scaleMode = .aspectFill
        
        skView.presentScene(menu)
        skView.ignoresSiblingOrder = true
        
        // TODO: Doesnt play on first go
        playStopBgMusic()
        
        let info = ["volume": ACTPlayerStats.shared.getMusicVolume()]
        NotificationCenter.default.post(name: setMusicVolumeNotificationName, object: nil, userInfo: info)
        
        
        
    }
    
    func addNotificationObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.setMusicVolume(_:)), name: setMusicVolumeNotificationName, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playStopBgMusic() {
        if ACTPlayerStats.shared.getSound() {
            backGroundMusic?.play()
        } else {
            backGroundMusic?.stop()
        }
        
    }
    
    @objc func setMusicVolume(_ info:Notification) {
        guard let userInfo = info.userInfo else {return}
        let volume = userInfo["volume"] as! Float
        setBackgroundMusicVolume(to: volume)
    }
    
    func setBackgroundMusicVolume(to volume: Float) {
        backGroundMusic?.volume = volume
    }

}
























