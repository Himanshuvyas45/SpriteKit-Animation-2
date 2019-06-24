//
//  GameViewController.swift
//  new2
//
//  Created by admin on 24/06/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {
    
    var skView: SKView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGameScene()
        
    }
    
    
    func setupGameScene() {
        let scene = GameScene(size: CGSize(width: 1080, height: 1920))
        scene.scaleMode = .aspectFill
        skView = self.view as? SKView
        skView.presentScene(scene)
        
    }
    
}
