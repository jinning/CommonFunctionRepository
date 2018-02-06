//
//  GCDTestViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/2.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "GCDTestViewController.h"

@interface GCDTestViewController ()

@end

@implementation GCDTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    //开启全局并发队列,开启多个线程
//    [self test01];
    
    //用异步函数往串行队列中添加任务，只开启了一个新的子线程
//    [self test02];
    
    //用同步函数往并发队列中添加任务，未开启新线程, 实际无法并发
//    [self test03];
    
    //用同步函数往串行队列中添加任务，未开启新线程
    [self test04];
}

- (void)gcdTest {
    // 同步 dispatch_sync  当前线程执行任务。
    // 异步 dispatch_async  新线程中执行任务，具备开启新线程的能力。
    // 并发 concurent dispatch queue 可以让多个任务同时执行(自动开启多个线程同时执行任务)，并发功能只有在异步函数下有效。
    // 串行 serial dispatch queue 任务一个接一个的执行。
    
    
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("test01", NULL);
    //创建主队列(和主线程相关的队列)，也是一种特殊的串行队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    //并发队列
    //GCD默认提供了全局的并发队列，供整个应用使用，无需手动创建
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    
}


- (void)test01 {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"下载图片01---%@", [NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片02---%@", [NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"下载图片03---%@", [NSThread currentThread]);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"下载图片04---%@", [NSThread currentThread]);
    });
    
    NSLog(@"主线程--%@", [NSThread currentThread]);
}

- (void)test02 {
    NSLog(@"主线程--%@",[NSThread currentThread]);
    
    //创建串行队列 第一个是名称， 第二个是队列的属性，一般不需要
    dispatch_queue_t queue = dispatch_queue_create("test02", NULL);
    
    dispatch_async(queue, ^{
        NSLog(@"下载图片01---%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片03---%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"下载图片02---%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"下载图片04---%@", [NSThread currentThread]);
    });
}

- (void)test03 {
    NSLog(@"主线程--%@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片01---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片02---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片03---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片04---%@", [NSThread currentThread]);
    });
}

- (void)test04 {
    NSLog(@"主线程--%@",[NSThread currentThread]);
    
    dispatch_queue_t queue = dispatch_queue_create("test04", NULL);
    
    dispatch_sync(queue, ^{
         NSLog(@"下载图片01---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下载图片02---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片03---%@", [NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"下载图片04---%@", [NSThread currentThread]);
    });
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
