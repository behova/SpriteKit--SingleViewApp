//
//  Manager.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

//singleton
class Manager {
    
    enum SceneType {
        case MainMenu, Gameplay
    }
    
    private init() {}
    static let shared = Manager()
    
    public func launch() {
        firstLaunch()
    }
    
    private func firstLaunch() {
        if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
            
            print("First launch!!")
            ACTPlayerStats.shared.setSounds(true)
            
            UserDefaults.standard.set(true, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
        }
    }
    func transition(_ fromScene: SKScene, toScene: SceneType, transition: SKTransition? = nil) {
        guard let scene = getScene(toScene) else { return }
        
        if let transition = transition {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene, transition: transition)
        } else {
            scene.scaleMode = .resizeFill
            fromScene.view?.presentScene(scene)
        }
       
        
    }
    
    func getScene(_ sceneType: SceneType) -> SKScene? {
        switch sceneType {
        case SceneType.MainMenu:
            return MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        case SceneType.Gameplay:
            return GamePlayScene(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        }
    }
    
    func runSound(_ fileName: String, onNode: SKNode) {
        if ACTPlayerStats.shared.getSound() {
            onNode.run(SKAction.playSoundFileNamed(fileName, waitForCompletion: false))
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
