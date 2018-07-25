//
//  GKTAudioAnimationContentView.m
//  GKTAudioAnimation
//
//  Created by Frank on 2018/7/24.
//  Copyright © 2018年 Frank. All rights reserved.
//

#import "GKTAudioAnimationContentView.h"

@interface GKTAudioAnimationContentView(){
    NSInteger   _lineCount;
    UIColor     *_lineColor;
    CGFloat     _lineWidth;
    CGFloat     _lineMaxHeight;
    CGFloat     _lineMinHeight;
    NSMutableArray *_lineArray;
}

@end

@implementation GKTAudioAnimationContentView

-(void)initConfig {
    _lineCount = 4;
    _lineColor = [UIColor redColor];
    _lineWidth = 1.0;
    _lineArray = [NSMutableArray array];
    _lineMaxHeight = self.bounds.size.height;
    _lineMinHeight = 2;
}

-(instancetype)initWithFrame:(CGRect)frame lineCount:(NSInteger)lineCount lineWidth:(CGFloat)lineWidth {
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
        _lineCount = lineCount;
        _lineWidth = lineWidth;
        [self createLineLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
        [self createLineLayer];
    }
    return self;
}


- (void)createLineLayer {
    
    CGFloat offset = 0;
    for (int i = 1; i < _lineCount+1; i++) {
        //初始化layer
        CALayer *layer = [[CALayer alloc] init];
        layer.backgroundColor = [UIColor redColor].CGColor;
        layer.anchorPoint = CGPointMake(0, 1);
        layer.position = CGPointMake(offset, _lineMaxHeight);
        layer.bounds = CGRectMake(0, 0, _lineWidth,1.0 * i * _lineMaxHeight / _lineCount);
        [self.layer addSublayer:layer];
        offset = CGRectGetMaxX(layer.frame) + (self.frame.size.width-_lineCount*_lineWidth)/3.0;
        [_lineArray addObject:layer];
    }
}

-(void)startAnimation
{
    for (int i = 0; i<_lineArray.count; i++) {
        CALayer *layer = [_lineArray objectAtIndex:i];
        //设置动画
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
        CGFloat height = _lineMinHeight + arc4random_uniform(_lineMaxHeight - _lineMinHeight);
        CGRect fromBouns = layer.bounds;
        fromBouns.size.height = 3;
        CGRect toBounds = layer.bounds;
        toBounds.size.height = height;
        animation.fromValue = [NSValue valueWithCGRect:fromBouns];
        animation.toValue = [NSValue valueWithCGRect:toBounds];
        animation.duration = 0.3 + drand48() * 0.2;
        animation.repeatCount = CGFLOAT_MAX;
        animation.autoreverses = YES;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        [layer addAnimation:animation forKey:@"oscillation"];
    }
}

-(void)stopAnimation {
    for (int i = 0; i<_lineArray.count; i++) {
        CALayer *layer = [_lineArray objectAtIndex:i];
        [layer removeAllAnimations];
    }
}

@end
