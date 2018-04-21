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
        
        skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
