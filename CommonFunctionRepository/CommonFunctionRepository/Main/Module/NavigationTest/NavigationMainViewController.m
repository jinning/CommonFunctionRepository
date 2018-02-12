//
//  NavigationMainViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "NavigationMainViewController.h"
#import "Test01AViewController.h"
#import "Test02AViewController.h"
#import "Test03AViewController.h"

@interface NavigationMainViewController ()

@end

@implementation NavigationMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转场动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *gcdTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [gcdTestBtn setTitle:@"动画效果1" forState:UIControlStateNormal];
    [gcdTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:gcdTestBtn];
    [gcdTestBtn addTarget:self action:@selector(clickTest01Btn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *alertViewTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [alertViewTestBtn setTitle:@"动画效果2" forState:UIControlStateNormal];
    [alertViewTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:alertViewTestBtn];
    [alertViewTestBtn addTarget:self action:@selector(clickTest02Btn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *zcTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 50)];
    [zcTestBtn setTitle:@"动画效果3" forState:UIControlStateNormal];
    [zcTestBtn setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:zcTestBtn];
    [zcTestBtn addTarget:self action:@selector(clickTest03Btn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickTest01Btn {
    Test01AViewController *a01VC = [[Test01AViewController alloc] init];
    [self.navigationController pushViewController:a01VC animated:YES];
}

- (void)clickTest02Btn {
    
}

- (void)clickTest03Btn {
    
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
