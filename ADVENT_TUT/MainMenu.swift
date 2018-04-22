//
//  MainMenu.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
   lazy var playButton: BDButton = {
        var button = BDButton(imageNamed: "dealbutton", buttonAction: {
            Manager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .down, duration: 0.5))
        })
    button.zPosition = 1
    return button
    }()
    
    override func didMove(to view: SKView) {
        print("inside main menu")
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        playButton.position = CGPoint.zero
        addChild(playButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    

}
