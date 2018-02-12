//
//  Test01AViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "Test01AViewController.h"
#import "Test01BViewController.h"

@interface Test01AViewController ()

@end

@implementation Test01AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"01A";
    
    UIButton *gcdTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [gcdTestBtn setTitle:@"点击跳转" forState:UIControlStateNormal];
    gcdTestBtn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
    [gcdTestBtn setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:gcdTestBtn];
    [gcdTestBtn addTarget:self action:@selector(click01ABtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click01ABtn {
    Test01BViewController *bVC = [[Test01BViewController alloc] init];
    [self.navigationController presentViewController:bVC animated:YES completion:nil];
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
