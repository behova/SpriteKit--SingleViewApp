//
//  GamePlayScene.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

class GamePlayScene: SKScene {
    override func didMove(to view: SKView) {
        print("inside gameplay")
        backgroundColor = .cyan
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                print("Going to main menu scene")
                Manager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .up, duration: 0.5))
            }
        }
    }
}
