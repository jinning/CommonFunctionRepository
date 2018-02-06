//
//  MainViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/1/31.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "MainViewController.h"
#import "GCDTestViewController.h"
#import "ThreadTestViewController.h"
#import "MutiThreadViewController.h"
#import "ThreadCommunicationViewController.h"

#import "BlockTestViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubviews];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%@--%@--%f--%@--%@--%zd", [JNPhoneInfo phoneVersion], [JNPhoneInfo phoneType], [JNPhoneInfo phoneBatterLevel], [JNPhoneInfo currentAppName], [JNPhoneInfo currentAppVersion], [JNPhoneInfo currentAppBuildVersion]);
}

- (void)addSubviews {
    UIButton *gcdTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [gcdTestBtn setTitle:@"GCD测试" forState:UIControlStateNormal];
    [gcdTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:gcdTestBtn];
    [gcdTestBtn addTarget:self action:@selector(clickGcdTestBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickGcdTestBtn {
//    GCDTestViewController *gcdTestVC = [[GCDTestViewController alloc] init];
//    ThreadTestViewController *threadVC = [[ThreadTestViewController alloc] init];
//    MutiThreadViewController *mutiThreadVC = [[MutiThreadViewController alloc] init];
//    ThreadCommunicationViewController *threadComVC = [[ThreadCommunicationViewController alloc] init];
    
    BlockTestViewController *blockTestVC = [[BlockTestViewController alloc] init];
    [self presentViewController:blockTestVC animated:YES completion:nil];
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
