//
//  GKTAudioAnimationContentView.h
//  GKTAudioAnimation
//
//  Created by Frank on 2018/7/24.
//  Copyright © 2018年 Frank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GKTAudioAnimationContentView : UIView

-(instancetype)initWithFrame:(CGRect)frame lineCount:(NSInteger)lineCount lineWidth:(CGFloat)lineWidth;

-(void)startAnimation;
-(void)stopAnimation;
@end
