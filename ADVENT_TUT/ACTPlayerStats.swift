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

enum SoundFileName: String {
    case click = "click.mp3"
}

//singleton
class ACTPlayerStats {
    private init() {}
    static let shared = ACTPlayerStats()
    
    func setSounds(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: kSoundState)
        UserDefaults.standard.synchronize()
    }
    
    func getSound() -> Bool {
        return UserDefaults.standard.bool(forKey: kSoundState)
    }
}
