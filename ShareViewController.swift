//
//  ShareViewController.swift
//  testSnap001
//
//  Created by Developer on 07/07/16.
//  Copyright © 2016 VT. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var segments: UISegmentedControl!
    @IBAction func segDone(sender: AnyObject) {
        let seg = sender as! UISegmentedControl
        let idx = seg.selectedSegmentIndex
        setImage(idx)
    }
    
    
    func setImage(index : Int)
    {
        let pic = self.imageFrame as UIImageView
        pic.image = imageSet[index]
    }
    
    var imageSet : [UIImage] = [] {
        didSet {
            // Update the view.
        }
    }
    
    func configureView() {
        segments.selectedSegmentIndex = 0
        setImage(0)
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
