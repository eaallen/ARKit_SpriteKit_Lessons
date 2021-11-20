//
//  Scene.swift
//  ARKitFromScratch
//
//  Created by Brian Advent on 27.05.18.
//  Copyright © 2018 Brian Advent. All rights reserved.
//

import SpriteKit
import ARKit

class Scene: SKScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // make sure sceneVew can be an ARSKView
        guard let sceneView = self.view as? ARSKView else {return}
        // get touch location
        if let touchLocation = touches.first?.location(in: sceneView){
            // perform a hit test
            if let hit = sceneView.hitTest(touchLocation, types: .featurePoint).first{
                // add ancore which we can use to put our bird image in the camera
                sceneView.session.add(anchor: ARAnchor(transform: hit.worldTransform))
            }
        }
        
    }
}
