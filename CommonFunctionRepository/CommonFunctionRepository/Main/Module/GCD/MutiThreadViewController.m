//
//  MutiThreadViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/2.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "MutiThreadViewController.h"

@interface MutiThreadViewController ()

@property (nonatomic, assign) int leftTicketCount;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@property (nonatomic, strong) NSThread *thread3;

@end

@implementation MutiThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.leftTicketCount = 10;
    
    //互斥锁
    [self threadSafeTest01];
    
    //原子锁
    [self threadSafeTest02];
}

- (void)threadSafeTest01 {
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread1.name = @"售票员A";
    [self.thread1 start];
    
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread2.name = @"售票员B";
    [self.thread2 start];
    
    self.thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(sellTickets) object:nil];
    self.thread3.name = @"售票员C";
    [self.thread3 start];
}


- (void)threadSafeTest02 {
    /**
     OC在定义属性的时候有 nonatomic 和 atomic两种选择
     atomic: 原子属性，为setter方法加锁
     nonatomic : 非原子属性，不会为setter方法加锁
     
     atomic 加锁原理，在属性的set方法中增加互斥锁
     
     iOS开发中，所有属性都应该声明为 nonatomic,尽量避免多线程抢夺同一块资源。
     尽量将加锁、资源抢夺的业务逻辑交给服务器端处理。
     */
}

- (void)sellTickets {
    /*
     互斥锁使用格式
     @synchronized(锁对象){//需要锁定的代码}
     锁定一份代码只用一把锁，用多把锁是无效的
     
     优点：有效防止多线程抢夺资源造成数据安全问题
     缺点：需要大量消耗cpu资源
     
     使用前提：多条线程抢夺同一块资源
     相关专业术语：线程同步，多条线程按顺序执行任务
     互斥锁，就是使用了线程同步技术
     */
    while (1) {
        @synchronized (self) { //加一把锁
            int count = self.leftTicketCount;
            if (count > 0) {
                [NSThread sleepForTimeInterval:0.02];
                self.leftTicketCount = count - 1;
                NSThread *thread = [NSThread currentThread];
                NSLog(@"%@--卖了一张票，还剩%d张票", thread.name, self.leftTicketCount);
            } else {
                [NSThread exit];
            }
        }
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
