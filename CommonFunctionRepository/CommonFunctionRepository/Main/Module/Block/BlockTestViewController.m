//
//  BlockTestViewController.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/6.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "BlockTestViewController.h"

typedef void(^SayHello)();
typedef int(^TotalResult)(int x, int y);

@interface BlockTestViewController ()

@end

@implementation BlockTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义一个block
    int (^testBlock)(int a, int b) = ^(int a, int b) {
        //block 无法修改外部变量，要想修改外部变量，变量需要用 __block 修饰
        //原因：block在捕获变量的时候回保存变量捕获时候的状态（对象变量除外），之后即使变量发生改变，block中的值也不会发生改变。
        //可以理解为block创建的时候对传入其中的值做了一次深拷贝
        return a + b;
    };
    int result = testBlock(10, 20);
    NSLog(@"%zd", result);
    
    SayHello hello = ^() {
        NSLog(@"helloWorld");
    };
    
    TotalResult totalResult = ^(int a, int b) {
        NSLog(@"%zd", a * b);
        return a * b;
    };
    
    hello();
    totalResult(10, 5);
    
    [self useBlockForOC:^int(int x, int y) {
        return x * y;
    }];
}

//Block 作为参数传递
-(void) useBlockForOC:(int(^)(int x, int y))aBlock {
    aBlock(300, 200);
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
