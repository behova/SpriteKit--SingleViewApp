//
//  Settings.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/22/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

class Settings: SKScene {
    
    lazy var shareButton: BDButton = {
        var button = BDButton(imageNamed: "green_button05", title:"Share", buttonAction: {
            self.handleShareButton()
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 0.25)
        button.titleLable?.fontSize = CGFloat.universalFont(size: 18)
        return button
    }()
    
    func handleShareButton() {
        Manager.shared.share(on: self, text: "I'm Sharing this shit", image: UIImage(named: "playerFace"), excludeActivityTypes: [.airDrop, .postToFacebook])
    }
    
    lazy var backButton: BDButton = {
        var button = BDButton(imageNamed: "green_button05", title: "GO BACK", buttonAction: {
            Manager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .up, duration: 0.5))
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 0.25)
        return button
    }()
    
    var volumeLabel: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "StockyRegular")
        label.fontSize = CGFloat.universalFont(size: 36)
        label.zPosition = 1
        label.text = "100%"
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        
        return label
    }()
    
    lazy var minusVolumeButton: BDButton = {
        var button = BDButton(imageNamed: "green_sliderDown", title: "-", buttonAction: {
            self.handleMinusVolume()
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 0.08)
        return button
    }()
    
    func handleMinusVolume() {
        
    }
    
    lazy var plusVolumeButton: BDButton = {
        var button = BDButton(imageNamed: "green_sliderUp", title: "-", buttonAction: {
            self.handlePlusVolume()
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 0.08)
        return button
    }()
    
    func handlePlusVolume() {
        
    }
    
    
    override func didMove(to view: SKView) {
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = .orange
        
        shareButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.height * -0.2)
        addChild(shareButton)
        
        backButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.height * -0.25)
        addChild(backButton)
        
        volumeLabel.position = CGPoint.zero
        addChild(volumeLabel)
        
        minusVolumeButton.position = CGPoint(x: ScreenSize.width * -0.2, y: ScreenSize.height * -0.01)
        addChild(minusVolumeButton)
        
        plusVolumeButton.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.height * 0.01)
        addChild(plusVolumeButton)
    }
}
