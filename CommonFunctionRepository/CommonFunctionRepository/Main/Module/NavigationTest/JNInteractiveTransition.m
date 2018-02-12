//
//  JNInteractiveTransition.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "JNInteractiveTransition.h"

@interface JNInteractiveTransition()

@property (nonatomic, weak) UIViewController *vc;
/**手势方向*/
@property (nonatomic, assign) JNTransitionGestureDirection direction;
/**手势类型*/
@property (nonatomic, assign) JNTransitionType type;
@end

@implementation JNInteractiveTransition

+ (instancetype)interactiveTransitionWithTransitionType:(JNTransitionType)type GestureDirection:(JNTransitionGestureDirection)direction{
    return [[self alloc] initWithTransitionType:type GestureDirection:direction];
}

- (instancetype)initWithTransitionType:(JNTransitionType)type GestureDirection:(JNTransitionGestureDirection)direction{
    self = [super init];
    if (self) {
        _direction = direction;
        _type = type;
    }
    return self;
}

- (void)addPanGestureForViewController:(UIViewController *)viewController{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    self.vc = viewController;
    [viewController.view addGestureRecognizer:pan];
}

- (void)handleGesture:(UIPanGestureRecognizer *)panGesture {
    
    //手势百分比
    CGFloat persent = 0;
    switch (_direction) {
        case JNTransitionGestureDirectionLeft: {
            CGFloat transitionX = -[panGesture translationInView:panGesture.view].x;
            persent = transitionX / panGesture.view.frame.size.width;
        }
            break;
        case JNTransitionGestureDirectionRight:{
            CGFloat transitionX = [panGesture translationInView:panGesture.view].x;
            persent = transitionX / panGesture.view.frame.size.width;
        }
            break;
        case JNTransitionGestureDirectionUp:{
            CGFloat transitionY = -[panGesture translationInView:panGesture.view].y;
            persent = transitionY / panGesture.view.frame.size.width;
        }
            break;
        case JNTransitionGestureDirectionDown:{
            CGFloat transitionY = [panGesture translationInView:panGesture.view].y;
            persent = transitionY / panGesture.view.frame.size.width;
        }
            break;
        default:
            break;
    }
}


@end
