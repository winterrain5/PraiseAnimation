//
//  PraiseImageView.swift
//  PopTipSwift_Example
//
//  Created by VICTOR03 on 2021/5/19.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

class PraiseImageView: UIImageView,CAAnimationDelegate {

    public var speed:Int = 0
    public var animateH:CGFloat = 0
    public var minX:CGFloat = 0
    public var maxX:CGFloat = 0
    
    func animate() {
        let min = UInt32(minX)
        let random = UInt32(maxX - minX)
        let animateDuration = arc4random_uniform(3) + UInt32(speed)
        self.alpha = 0
        
        let xAnimate = CAKeyframeAnimation(keyPath: "position.x")
        xAnimate.duration = CFTimeInterval(animateDuration)
        xAnimate.values = [self.layer.position.x,arc4random_uniform(random)+min,arc4random_uniform(random)+min,arc4random_uniform(random)+min]
        xAnimate.fillMode = .forwards
        xAnimate.isRemovedOnCompletion = false
        
        let yAnimate = CABasicAnimation(keyPath: "position.y")
        yAnimate.duration = CFTimeInterval(animateDuration)
        yAnimate.timingFunction = CAMediaTimingFunction.init(name: CAMediaTimingFunctionName.easeInEaseOut)
        yAnimate.fromValue = self.frame.origin.y
        yAnimate.toValue = self.frame.origin.y - (CGFloat(arc4random_uniform(50))+animateH)
        yAnimate.fillMode = .forwards
        yAnimate.isRemovedOnCompletion = false
        
        let opacityAnimate = CABasicAnimation(keyPath: "opacity")
        opacityAnimate.duration = CFTimeInterval(animateDuration + 1)
        opacityAnimate.fromValue = 1
        opacityAnimate.toValue = 0
        opacityAnimate.delegate = self
        opacityAnimate.fillMode = .forwards
        opacityAnimate.isRemovedOnCompletion = false
        
        self.layer.add(xAnimate, forKey: nil)
        self.layer.add(yAnimate, forKey: nil)
        self.layer.add(opacityAnimate, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.isHidden = true
        self.removeFromSuperview()
        self.layer.removeAllAnimations()
    }

}
