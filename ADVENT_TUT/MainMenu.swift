//
//  MainMenu.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    override func didMove(to view: SKView) {
        print("inside main menu")
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addPlayButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                print("going to gameplay scene")
                //Manager.shared.transition(self, toScene: .Gameplay)
                Manager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .down, duration: 0.5))
            }
        }
    }
    
    func addPlayButton() {
        let playButton = SKSpriteNode(imageNamed: "dealbutton")
        playButton.position = CGPoint.zero
        addChild(playButton)
    }
}
