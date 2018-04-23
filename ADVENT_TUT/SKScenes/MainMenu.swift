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
    
    lazy var settingsButton: BDButton = {
        var button = BDButton(imageNamed: "blue_button05", title: "Settings", buttonAction: {
            Manager.shared.transition(self, toScene: .Settings, transition: SKTransition.moveIn(with: .down, duration: 0.5))
        })
        
        button.scaleTo(ScreenWithPercentage: 0.35)
        button.zPosition = 1
        return button
    }()
    
    override func didMove(to view: SKView) {
        backgroundColor = .yellow
        print("inside main menu")
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        playButton.position = CGPoint.zero
        addChild(playButton)
        //playButton.logAvailableFonts()
        
        settingsButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.height * -0.2)
        addChild(settingsButton)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

    }
    

}
