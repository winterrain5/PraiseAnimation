//
//  PraiseImage.m
//  Pods-PraiseAnimation_Example
//
//  Created by VICTOR03 on 2021/5/7.
//

#import "PraiseImage.h"


@implementation PraiseImage
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _speed = 5;
        _animateH = 300;
    }
    return self;
}

-(void)animate
{
    
    CGFloat min = _minX;
    CGFloat random = _maxX - _minX;
    CGFloat animateDuration = arc4random_uniform(3)+_speed;
    self.alpha = 0;
    CABasicAnimation *scaleAnimate =[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimate.duration = 0.2;
    scaleAnimate.fromValue = @0.2;
    scaleAnimate.toValue = @1;
    
    CAKeyframeAnimation *xAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    xAnimate.duration = animateDuration;
    xAnimate.values = @[@(self.layer.position.x),@(arc4random_uniform(random)+min),@(arc4random_uniform(random)+min),@(arc4random_uniform(random)+min)];
    
    CABasicAnimation *yAnimate =[CABasicAnimation animationWithKeyPath:@"position.y"];
    yAnimate.duration = animateDuration;
    yAnimate.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    yAnimate.fromValue = @(self.frame.origin.y);
    yAnimate.toValue = @(self.frame.origin.y-(arc4random_uniform(50)+_animateH));
    
    CABasicAnimation *opacityAnimate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimate.duration = animateDuration+1;
    opacityAnimate.fromValue = @1;
    opacityAnimate.toValue = @0;
    opacityAnimate.delegate = self;
    
    xAnimate.fillMode = kCAFillModeForwards;
    xAnimate.removedOnCompletion = NO;
    
    yAnimate.fillMode = kCAFillModeForwards;
    yAnimate.removedOnCompletion = NO;
    
    opacityAnimate.fillMode = kCAFillModeForwards;
    opacityAnimate.removedOnCompletion = NO;
    
    scaleAnimate.fillMode = kCAFillModeForwards;
    scaleAnimate.removedOnCompletion = NO;
    
    [self.layer addAnimation:xAnimate forKey:nil];
    [self.layer addAnimation:yAnimate forKey:nil];
    [self.layer addAnimation:opacityAnimate forKey:nil];
//    [self.layer addAnimation:scaleAnimate forKey:nil];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.hidden = YES;
    [self removeFromSuperview];
    [self.layer removeAllAnimations];
}
@end

