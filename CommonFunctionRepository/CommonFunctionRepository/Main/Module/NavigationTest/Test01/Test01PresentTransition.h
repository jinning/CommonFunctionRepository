//
//  Test01PresentTransition.h
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, JNPresentOneTransitionType) {
    JNPresentOneTransitionTypePresent = 0, //管理present动画
    JNPresentOneTransitionTypeDismiss //管理dismiss动画
};

@interface Test01PresentTransition : NSObject <UIViewControllerAnimatedTransitioning>

+ (instancetype)transitionWithTransitionType:(JNPresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(JNPresentOneTransitionType)type;

@end
