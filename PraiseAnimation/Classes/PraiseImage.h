//
//  PraiseImage.h
//  Pods-PraiseAnimation_Example
//
//  Created by VICTOR03 on 2021/5/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PraiseImage : UIImageView <CAAnimationDelegate>
@property (nonatomic ,assign) CGFloat speed;
@property (nonatomic ,assign) CGFloat animateH;
@property (nonatomic ,assign) CGFloat minX;
@property (nonatomic ,assign) CGFloat maxX;
-(void)animate;
@end

NS_ASSUME_NONNULL_END
