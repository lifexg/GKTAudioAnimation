//
//  ViewController.m
//  GKTAudioAnimation
//
//  Created by Frank on 2018/7/24.
//  Copyright © 2018年 Frank. All rights reserved.
//

#import "ViewController.h"
#import "GKTAudioAnimationContentView.h"
@interface ViewController (){
    GKTAudioAnimationContentView *vc;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    vc = [[GKTAudioAnimationContentView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    [self.view addSubview:vc];
}

- (IBAction)start:(id)sender {
    [vc startAnimation];
}

- (IBAction)stop:(id)sender {
    [vc stopAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
