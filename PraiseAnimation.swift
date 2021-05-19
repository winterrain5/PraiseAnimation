//
//  PraiseAnimation.swift
//  PopTipSwift_Example
//
//  Created by VICTOR03 on 2021/5/19.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit

open class PraiseAnimation {
    /// 动画对象大小 默认(25,25)
    public var imageSize = CGSize(width: 25, height: 25)
    /// 动画移动高度 默认(300)
    public var animationH:CGFloat = 300
    /// 动画左右幅度 以起点位置为参照点 默认50
    public var leftSpacing:CGFloat = 50
    public var rightSpacing:CGFloat = 50
    /// 动画速度 默认 5
    public var speed:Int = 5
    /// 动画位置
    public var point:CGPoint = .zero
    
    private var imageArray:[UIImage] = []
    private var view:UIView!
    
    public init(with imageArray:[UIImage], onView: UIView, point:CGPoint) {
        self.imageArray = imageArray
        self.view = onView
        self.point = point
    }
  
    public func animate(count:Int = 1) {
        for _ in 0..<count {
            let random = imageArray.count
            let index = Int(arc4random_uniform(UInt32(random)))
            let image = imageArray[index]
            let praise = PraiseImageView()
            praise.image = image
            praise.frame = CGRect(x: point.x,
                                  y: point.y,
                                  width: image.size.width,
                                  height: image.size.height)
            praise.animateH = animationH
            praise.speed = speed
            praise.minX = point.x - leftSpacing
            praise.maxX = praise.frame.maxX + rightSpacing
            view.addSubview(praise)
            praise.animate()
        }
    }
}
