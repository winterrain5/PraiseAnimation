//
//  PraiseAnimation.h
//  PraiseAnimation
//
//  Created by Derrick on 2020/9/25.
//  Copyright © 2020 Victor. All rights reserved.
//

#import "PraiseAnimation.h"
#import "PraiseImage.h"
@interface PraiseAnimation()
@property (nonatomic ,strong) NSArray<UIImage *>* imageArray;
@property (nonatomic ,weak) UIView *view;

@end
@implementation PraiseAnimation
-(instancetype)initWithImageArray:(NSArray<UIImage *>*)imageArray onView:(UIView *)view point:(CGPoint)point{
    self = [super init];
    if (self) {
        _imageArray = imageArray;
        _view = view;
        _point = point;
        _imageSize = CGSizeMake(25, 25);
        _speed = 5;
        _animationH = 300.0;
        _leftSpacing = 50.0;
        _rightSpacing = 50.0;
    }
    return self;
}

- (instancetype)initWithImageArray:(NSArray<UIImage *> *)imageArray onView:(UIView *)view {
    self = [super init];
    if (self) {
        _imageArray = imageArray;
        _view = view;
        _imageSize = CGSizeMake(25, 25);
        _speed = 5;
        _animationH = 300.0;
        _leftSpacing = 50.0;
        _rightSpacing = 50.0;
    }
    return self;
}
-(void)animate:(NSInteger)count{
    if (count == 0) count = 1;
    for (int i = 0; i < count; i++) {
        int random = (int)[_imageArray count];
        NSInteger index = arc4random_uniform(random);
        UIImage *image = _imageArray[index];
        PraiseImage *praise = [[PraiseImage alloc] initWithImage:image];
        praise.frame = CGRectMake(_point.x, _point.y, _imageSize.width, _imageSize.height);
        praise.animateH = _animationH;
        praise.speed = _speed;
        praise.minX = _point.x - _leftSpacing;
        praise.maxX = CGRectGetMaxX(praise.frame) + _rightSpacing;
        [_view addSubview:praise];
        [praise animate];
    }
}


@end
