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
    
    lazy var countdownLable: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "StockyRegular")
        label.fontSize = CGFloat.universalFont(size: 20)
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .left
        label.verticalAlignmentMode = .center
        label.text = "\(counterStartValue)"
        return label
    }()
    
    var counter = 0
    var counterTimer = Timer()
    var counterStartValue = 60
    
    override func didMove(to view: SKView) {
        print("inside gameplay")
        backgroundColor = .cyan
        backButton.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.height * 0.85)
        addChild(backButton)
        
        countdownLable.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.height * 0.80)
        addChild(countdownLable)
        
        counter = counterStartValue
        startCounter()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func startCounter() {
        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
    }
    
    @objc func decrementCounter() {
        counter -= 1
        countdownLable.text = "\(counter)"
    }
    
    
    
    
    
    
    
}
