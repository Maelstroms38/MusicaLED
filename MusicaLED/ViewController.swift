//
//  ViewController.swift
//  MusicaLED
//
//  Created by Michael Stromer on 8/5/17.
//  Copyright © 2017 Michael Stromer. All rights reserved.
//

import UIKit
import GradientView

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let imageView1: UIImageView = UIImageView()
    let imageView2: UIImageView = UIImageView()
    let imageView3: UIImageView = UIImageView()
    let imageView4: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = self.view.bounds.width
        let screenHeight = self.view.bounds.height
        
        // Initialize a gradient view
        let gradientView = GradientView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        // Set the gradient colors
        gradientView.colors = [.blue, #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), .red, .yellow, .green, #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)]
        
        // Optionally change the direction. The default is vertical.
        gradientView.direction = .vertical
        
        // Add it as a subview in all of its awesome
        view.addSubview(gradientView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapHandler))
        tap.numberOfTapsRequired = 1
        tap.cancelsTouchesInView = false
        tap.delegate = self
        gradientView.addGestureRecognizer(tap)
        
        imageView1.image = UIImage(named:"whole")
        var newRect = CGRect(x:0, y:0, width: screenWidth/16, height: screenWidth/20)
        imageView1.frame = newRect
        imageView1.center = CGPoint(x:self.view.bounds.width/3, y:self.view.bounds.height/2)
        imageView1.isUserInteractionEnabled = true
        self.view.addSubview(imageView1)
        
        imageView2.image = UIImage(named:"half")
        newRect = CGRect(x:0, y:0, width:screenWidth/20, height: screenHeight/4)
        imageView2.frame = newRect
        imageView2.center = CGPoint(x:self.view.bounds.width/2.5, y:self.view.bounds.height/2)
        imageView2.isUserInteractionEnabled = true
        self.view.addSubview(imageView2)
        
        imageView3.image = UIImage(named:"quarter")
        newRect = CGRect(x:0, y:0, width:screenWidth/20, height:screenHeight/4)
        imageView3.frame = newRect
        imageView3.center = CGPoint(x:self.view.bounds.width/2, y:self.view.bounds.height/2)
        imageView3.isUserInteractionEnabled = true
        self.view.addSubview(imageView3)
        
        imageView4.image = UIImage(named:"eigth")
        newRect = CGRect(x:0, y:0, width: screenWidth/14, height: screenWidth/6)
        imageView4.frame = newRect
        imageView4.center = CGPoint(x:self.view.bounds.width/1.5, y:self.view.bounds.height/2)
        imageView4.isUserInteractionEnabled = true
        self.view.addSubview(imageView4)
        
        let panGestureRecognizer1 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        let panGestureRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        let panGestureRecognizer3 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        let panGestureRecognizer4 = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        imageView1.addGestureRecognizer(panGestureRecognizer1)
        imageView2.addGestureRecognizer(panGestureRecognizer2)
        imageView3.addGestureRecognizer(panGestureRecognizer3)
        imageView4.addGestureRecognizer(panGestureRecognizer4)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == gestureRecognizer.view
    }
    // called by gesture recognizer
    @objc func tapHandler(gesture: UITapGestureRecognizer) {
        
        // handle touch down and touch up events separately
        if gesture.state == .began {
            // do something...
        } else if gesture.state == .ended { // optional for touch up event catching
            // do something else...
            //let color = returnColorFromPoint(point: gesture.location(in: self.view))
//            if let comps = color.cgColor.components {
//                let trueColor = UIColor.init(colorLiteralRed: Float(comps[0]*255), green: Float(comps[1]*255), blue: Float(comps[2]*255), alpha: Float(comps[3]))
//            }
        }
    }
    func panGesture(sender:UIPanGestureRecognizer) {
        
        if let view = sender.view {
//        if sender.state == UIGestureRecognizerState.began {
//            preDx = view.frame.origin.x
//            preDy = view.frame.origin.y
//        }
        let point: CGPoint = sender.translation(in: self.view)
        
            let movedPoint: CGPoint = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
            view.center = movedPoint
            sender.setTranslation(CGPoint.zero, in: self.view)
        }
    }
    func returnColorFromPoint(point: CGPoint) -> UIColor {
        let height = self.view.bounds.height
        let pointY = point.y
        var color = UIColor.white
        if pointY <= height/6 {
            color = .blue
        } else if pointY <= height/3 {
            color = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        } else if pointY <= height/2 {
            color = .red
        } else if pointY <= height*2/3 {
            color = .yellow
        } else if pointY <= height*5/6 {
            color = .green
        } else if pointY <= height {
            color = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        } else {
            color = .red
        }
        return color
    }
    
}

