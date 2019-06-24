//
//  GameScene.swift
//  new2
//
//  Created by admin on 24/06/19.
//  Copyright © 2019 professional. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    let gem = SKSpriteNode(imageNamed: "gem")
    //    private var label : SKLabelNode?
    //    private var spinnyNode : SKShapeNode?
    //
    override func didMove(to view: SKView) {
        addBackground()
        addGem()
        addEmitter()
        
    }
    
    
    func addBackground() {
        let backdrop = SKSpriteNode(imageNamed: Background.tornado)
        addChild(backdrop)
        backdrop.position = CGPoint(x: size.width / 2, y: size.height / 2)
        backdrop.zPosition = Layers.background
    }
    
    func addGem() {
        addChild(gem)
        gem.position = CGPoint(x: size.width / 1.3, y: size.height / 1.4)
        gem.zPosition = Layers.gem
        gem.setScale(2.7)
    }
    
    func addEmitter() {
        
        let emitter = SKEmitterNode(fileNamed: Emitter.dust)!
        emitter.zPosition = Layers.emitter
        emitter.position = CGPoint(x: size.width / 2, y: size.height)
        emitter.advanceSimulationTime(30)
        addChild(emitter)
        
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if gem.contains(touchLocation) {
            explodeGem()
        }
        
    }
    
    func explodeGem() {
        let emitter = SKEmitterNode(fileNamed: Emitter.gem)!
        emitter.position = gem.position
        addChild(emitter)
        gem.removeFromParent()
    }
}

