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
        var button = BDButton(imageNamed: "yellow_button05", title: "GO BACK", buttonAction: {
            self.showAlert()
        })
        button.zPosition = 1
        button.scaleTo(ScreenWithPercentage: 0.35)
        return button
    }()
    
    func showAlert() {
        let okAction = UIAlertAction(title: "OK", style: .default) { (result) in
            print("OK button tapped.")
            Manager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .up, duration: 0.5))
        }
        Manager.shared.showAlert(on: self, title: "Going Back", message: "Leaving Gameplay.", style: .alert, actions: [okAction]) {
            print("Showed Alert.")
        }
    }
    
    lazy var countdownLable: SKLabelNode = {
        var label = SKLabelNode(fontNamed: "StockyRegular")
        label.fontSize = CGFloat.universalFont(size: 20)
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .left
        label.verticalAlignmentMode = .center
        label.text = "00:00"
        return label
    }()
    
    var counter = 0
    var counterTimer = Timer()
    var counterStartValue = 6
    
    var isGameOver = false
    
    lazy var scoreLable: SKLabelNode = {
       var label = SKLabelNode(fontNamed: "StockyRegular")
        label.fontSize = CGFloat.universalFont(size: 35)
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .right
        label.verticalAlignmentMode = .center
        label.text = "\(scoreStartValue)"
        return label
    }()
    
    var score = 0
    var scoreStartValue = 6
    
    override func didMove(to view: SKView) {
        print("inside gameplay")
        backgroundColor = .cyan
        backButton.position = CGPoint(x: ScreenSize.width * 0.24, y: ScreenSize.height * 0.85)
        addChild(backButton)
        
        countdownLable.position = CGPoint(x: ScreenSize.width * 0.16, y: ScreenSize.height * 0.80)
        addChild(countdownLable)
        
        scoreLable.position = CGPoint(x: ScreenSize.width * 0.96, y: ScreenSize.height * 0.80)
        addChild(scoreLable)
        
        counter = counterStartValue
        startCounter()
        
        score = scoreStartValue
        
        addSwipeGestureRecognizers()
    }
    
    func addSwipeGestureRecognizers() {
        let gestureDirections: [UISwipeGestureRecognizerDirection] = [.up, .down, .left, .right]
        for gestureDirection in gestureDirections {
            let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            gestureRecognizer.direction = gestureDirection
            self.view?.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    @objc func handleSwipe(gesture: UIGestureRecognizer) {
        if let gesture = gesture as? UISwipeGestureRecognizer {
            switch gesture.direction {
            case .up:
                print("Swipe up")
            case .down:
                print("Swipe down")
            case .left:
                print("Swipe left")
            case .right:
                print("Swipe right")
            default:
                print("no such gesture")
            }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch == touches.first {
                print("Tapped")
                
                if !isGameOver {
                    score -= 1
                    updateScore()
                }
                
                if score <= 0 {
                    isGameOver = true
                    gameOver(won: true)
                }
            }
        }
    }
    
    func startCounter() {
        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
    }
    
    func stopCounter() {
        counterTimer.invalidate()
    }
    
    @objc func decrementCounter() {
        
        if !isGameOver {
        
            if counter <= 1 {
                stopCounter()
                isGameOver = true
                gameOver(won: false)
            }
            
            counter -= 1
            
            let minutes = counter / 60
            let seconds = counter % 60
            //turnary ops to check ifs
            let minutesText = minutes < 10 ? "0\(minutes)" : "\(minutes)"
            let secondsText = seconds < 10 ? "0\(seconds)" : "\(seconds)"
            
            
            countdownLable.text = "\(minutesText):\(secondsText)"
        }
        
    }
    
    func updateScore() {
        scoreLable.text = "\(score)"
    }
    
    func gameOver(won: Bool) {
        print("Game Over With Status: \(won)")
    }
    
    
    
    
    
    
    
}
