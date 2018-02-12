//
//  JNInteractiveTransition.h
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GestureConfig)(void);

typedef NS_ENUM(NSUInteger, JNTransitionGestureDirection) {//手势的方向
    JNTransitionGestureDirectionLeft = 0,
    JNTransitionGestureDirectionRight,
    JNTransitionGestureDirectionUp,
    JNTransitionGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, JNTransitionType) {//手势控制哪种转场
    JNTransitionTypePresent = 0,
    JNTransitionTypeDismiss,
    JNTransitionTypePush,
    JNTransitionTypePop
};

@interface JNInteractiveTransition : UIPercentDrivenInteractiveTransition
//记录是否开始手势，判断pop操作是手势触发还是返回键触发
@property (nonatomic, assign) BOOL interation;
//触发手势present的时候的config，config中初始化并present需要弹出的控制器
@property (nonatomic, copy) GestureConfig presentConfig;
//触发手势push的时候的config，config中初始化并push需要弹出的控制器
@property (nonatomic, copy) GestureConfig pushConfig;

//初始化方法
+ (instancetype)interactiveTransitionWithTransitionType:(JNTransitionType)type GestureDirection:(JNTransitionGestureDirection)direction;
- (instancetype)initWithTransitionType:(JNTransitionType)type GestureDirection:(JNTransitionGestureDirection)direction;

/** 给传入的控制器添加手势*/
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
