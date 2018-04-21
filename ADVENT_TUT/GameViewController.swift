//
//  GameViewController.swift
//  ADVENT_TUT
//
//  Created by iMac on 4/21/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    let skView: SKView = {
        let view = SKView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(skView)
        skView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        
        let menu = MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.height))
        menu.scaleMode = .aspectFill
        skView.presentScene(menu)
        skView.ignoresSiblingOrder = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

