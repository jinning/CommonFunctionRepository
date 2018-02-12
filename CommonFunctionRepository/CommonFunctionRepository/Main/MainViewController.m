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

#import "NavigationMainViewController.h"

#import "JNAlertView.h"

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
    
    UIButton *alertViewTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [alertViewTestBtn setTitle:@"弹出自定义alertview" forState:UIControlStateNormal];
    [alertViewTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:alertViewTestBtn];
    [alertViewTestBtn addTarget:self action:@selector(clickAlertViewTestBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *zcTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [zcTestBtn setTitle:@"自定义转场动画" forState:UIControlStateNormal];
    [zcTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:zcTestBtn];
    [zcTestBtn addTarget:self action:@selector(clickZcTestBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickGcdTestBtn {
//    GCDTestViewController *gcdTestVC = [[GCDTestViewController alloc] init];
//    ThreadTestViewController *threadVC = [[ThreadTestViewController alloc] init];
//    MutiThreadViewController *mutiThreadVC = [[MutiThreadViewController alloc] init];
//    ThreadCommunicationViewController *threadComVC = [[ThreadCommunicationViewController alloc] init];
    
    BlockTestViewController *blockTestVC = [[BlockTestViewController alloc] init];
    [self.navigationController pushViewController:blockTestVC animated:YES];
}

- (void)clickAlertViewTestBtn {
//    JNAlertView *alertView = [[JNAlertView alloc] initWithTitle:@"测试" message:@"这是一个AlertView" confirmBtn:@"确定" cancleBtn:@"取消"];
//    [alertView showJNAlertView];
//    alertView.confirmResult = ^{
//        NSLog(@"点击了确定按钮");
//    };
//    [alertView setCancelResult:^{
//        NSLog(@"点击了取消按钮");
//    }];
    
    JNAlertView *alertView = [[JNAlertView alloc] initWithTitle:@"测试" message:@"测试用超长字符串如何处理，这是一个问题，怎么解决呢各位同志哦哦哦哦哦哦哦哦反对科萨里放到拉萨了反对撒反对将撒放到拉萨了反对反对撒反对撒风 i 哦小奥 i 洞赛风测试第三极富迪斯奥佛斯奥反对塞哦 i 哦粉底哦塞哦发 i 哦迪赛芬迪撒" confirmBtn:@"确定" confirmResult:^{
        NSLog(@"点击了确定按钮");
    } cancleBtn:@"取消" cancelResult:^{
        NSLog(@"点击了取消按钮");
    }];
    [alertView showJNAlertView];
}

- (void)clickZcTestBtn {
    NavigationMainViewController *naVC = [[NavigationMainViewController alloc] init];
    [self.navigationController pushViewController:naVC animated:YES];
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
