//
//  GameViewController.swift
//  testSnap001
//
//  Created by Developer on 06/07/16.
//  Copyright © 2016 VT. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var sceneView: SCNView!
    
    func image(background : UIColor) -> UIImage
    {
        let scnView = self.sceneView as SCNView
        SCNTransaction.begin()
        scnView.backgroundColor = background
        SCNTransaction.commit()
        let img = scnView.snapshot()
        return img
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // create and add a camera to the scene
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        scene.rootNode.addChildNode(cameraNode)
        
        // place the camera
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = SCNLightTypeOmni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = SCNLightTypeAmbient
        ambientLightNode.light!.color = UIColor.darkGrayColor()
        scene.rootNode.addChildNode(ambientLightNode)
        
        // retrieve the SCNView
        let scnView = self.sceneView as SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        scnView.showsStatistics = false
        
        // configure the view
        scnView.backgroundColor = UIColor.blackColor()
        
        // add a tap gesture recognizer
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    // MARK: Navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)  {
        if segue.identifier == "showPicture" {
            let controller = (segue.destinationViewController as! UINavigationController).topViewController as! ShareViewController
            let imageBlank = image(UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0))
            let imageWhite = image(UIColor.whiteColor())
            let imageBlack = image(UIColor.blackColor())
            let imageSet = [imageBlack, imageBlank, imageWhite]
            controller.imageSet = imageSet
        }
    }
    
    
}
