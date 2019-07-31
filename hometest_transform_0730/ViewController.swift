//
//  ViewController.swift
//  hometest_transform_0730
//
//  Created by 洪得維 on 2019/7/30.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mysegment: UISegmentedControl!
    var myview:UIView!
    var timer:Timer!
    var count:Double = 0.0
     var speed = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        myview = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        myview.center = self.view.center
        myview.backgroundColor = UIColor.red
        // let angle = 45 * Double.pi/180  //公式
        myview.transform = CGAffineTransform(rotationAngle: CGFloat(0)) //角度
        view.addSubview(myview)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(transform) , userInfo: nil, repeats: true)
    }
    
    @objc func transform(){
        let angle = count * Double.pi/180  //公式
        myview.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        
        count += speed
//        if (self.mysegment.selectedSegmentIndex == 0 ){
//            count += 1
//        }else{
//            count -= 1
//        }
        
    }
    
    @IBAction func segmentaction(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            speed = 5
        case 1:
            speed = 15
        default:
            break
        }
        
    }
    @IBAction func slider(_ sender: UISlider) {
        //print(sender.value)
        speed = Double(sender.value)
    }
    
}

