//
//  ACTPlayerStats.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/22/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import Foundation
import SpriteKit

let kSoundState = "kSoundState"
let kBackgroundMusic = "backGround"
let kBackgroundExt = "mp3"
let kScore = "kScore"
let kBestScore = "kBestScore"
let kMusicVolume = "kMusicVolume"

enum SoundFileName: String {
    case click = "click.mp3"
}

//singleton
class ACTPlayerStats {
    private init() {}
    static let shared = ACTPlayerStats()
    
    func setScore(_ value: Int) {
        
        if value > getBestScore() {
            
            setBestScore(value)
        }
        UserDefaults.standard.set(value, forKey: kScore)
        UserDefaults.standard.synchronize()
    }
    
    func getScore() -> Int {
        return UserDefaults.standard.integer(forKey: kScore)
    }
    
    func setBestScore(_ value: Int) {
        UserDefaults.standard.set(value, forKey: kBestScore)
        UserDefaults.standard.synchronize()
    }
    
    func getBestScore() -> Int {
        return UserDefaults.standard.integer(forKey: kBestScore)
    }
    
    func setSounds(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: kSoundState)
        UserDefaults.standard.synchronize()
    }
    
    func getSound() -> Bool {
        return UserDefaults.standard.bool(forKey: kSoundState)
    }
    
    func saveMusicVolume(_ value: Float) {
        UserDefaults.standard.set(value, forKey: kMusicVolume)
        UserDefaults.standard.synchronize()
    }
    
    func getMusicVolume() -> Float {
        return UserDefaults.standard.float(forKey: kMusicVolume)
    }
}
























