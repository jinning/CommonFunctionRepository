//
//  ThreadTestViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/2.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "ThreadTestViewController.h"

@interface ThreadTestViewController ()

@end

@implementation ThreadTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    [self test01];
}

- (void)test01 {
    //获取当前线程;
    NSThread *thread = [NSThread currentThread];
    //获取主线程
    NSThread *mainThread = [NSThread mainThread];
    
    //先创建初始化线程， start开启线程
    [self createThread01];
    
    //创建完线程直接启动
    [self createThread02];
    
    //隐式创建线程并直接启动
    [self createThread03];
}

- (void)createThread01 {
    // 初始化子线程
    NSThread *subThread = [[NSThread alloc] initWithTarget:self selector:@selector(subThreadRun:) object:@"子线程"];
    // 线程名
    subThread.name = @"test01";
    // 开启线程
    [subThread start];
}

- (void)createThread02 {
    [NSThread detachNewThreadSelector:@selector(subThreadRun:) toTarget:self withObject:@"创建完线程直接(自动)启动"];
}

- (void)createThread03 {
    [self performSelectorInBackground:@selector(subThreadRun:) withObject:@"隐式创建"];
}

- (void)subThreadRun:(NSString *)str {
    NSThread *thread = [NSThread currentThread];
    for (int i = 0; i < 10; i++) {
        NSLog(@"%@--%@", thread, str);
    }
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
