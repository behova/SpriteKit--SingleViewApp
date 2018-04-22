//
//  GamePlayScene.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

class GamePlayScene: SKScene {
    
    
    lazy var backButton: BDButton = {
        var button = BDButton(imageNamed: "YButton", title: "GO BACK", buttonAction: {
            Manager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .up, duration: 0.5))
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 1)
        return button
    }()
    
    override func didMove(to view: SKView) {
        print("inside gameplay")
        backgroundColor = .cyan
        backButton.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.height * 0.85)
        addChild(backButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
