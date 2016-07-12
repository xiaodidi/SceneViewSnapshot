//
//  ShareViewController.swift
//  testSnap001
//
//  Created by Developer on 07/07/16.
//  Copyright © 2016 VT. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    var index : Int = 0
    
    var imageSet : [UIImage] = []

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var segments: UISegmentedControl!
    @IBAction func segDone(sender: AnyObject) {
        let seg = sender as! UISegmentedControl
        self.index = seg.selectedSegmentIndex
        setImage(index)
    }
    @IBAction func share(sender: AnyObject) {
        let activityController = UIActivityViewController (activityItems: [imageSet[index] as UIImage], applicationActivities: nil)
        activityController.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem
        presentViewController(activityController, animated: true, completion: nil)
    }
    
    func setImage(index : Int)
    {
        let pic = self.imageFrame as UIImageView
        pic.image = imageSet[index]
    }
    
    
    func configureView() {
        segments.selectedSegmentIndex = index
        setImage(index)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape
    }
    
}
