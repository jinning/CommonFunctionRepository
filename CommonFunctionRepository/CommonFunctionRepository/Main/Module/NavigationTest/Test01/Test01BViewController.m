//
//  Test01BViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "Test01BViewController.h"
#import "Test01PresentTransition.h"

@interface Test01BViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation Test01BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"01B";
    self.view.backgroundColor = [UIColor redColor];
    UIButton *gcdTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [gcdTestBtn setTitle:@"点击跳转" forState:UIControlStateNormal];
    gcdTestBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
    [gcdTestBtn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:gcdTestBtn];
    [gcdTestBtn addTarget:self action:@selector(click01BBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self configureTransition];
}



- (void)click01BBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 转场动画相关
- (void)configureTransition {
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [Test01PresentTransition transitionWithTransitionType:JNPresentOneTransitionTypePresent];
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [Test01PresentTransition transitionWithTransitionType:JNPresentOneTransitionTypeDismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
