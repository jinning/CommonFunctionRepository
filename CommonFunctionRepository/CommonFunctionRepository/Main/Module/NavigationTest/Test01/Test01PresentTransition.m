//
//  Test01PresentTransition.m
//  CommonFunctionRepository
//
//  Created by Renjie Zhou on 2018/2/7.
//  Copyright © 2018年 JinNing. All rights reserved.
//

#import "Test01PresentTransition.h"

@interface Test01PresentTransition()

@property (nonatomic, assign) JNPresentOneTransitionType type;

@end

@implementation Test01PresentTransition

#pragma mark - 自定义方法
+ (instancetype)transitionWithTransitionType:(JNPresentOneTransitionType)type {
    return [[self alloc] initWithTransitionType:type];
}

- (instancetype)initWithTransitionType:(JNPresentOneTransitionType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}


#pragma mark - UIViewControllerAnimatedTransitioning 代理方法
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    switch (self.type) {
        case JNPresentOneTransitionTypePresent:
            [self presentAnimation:transitionContext];
            break;
        case JNPresentOneTransitionTypeDismiss:
            [self dismissAnimation:transitionContext];
            break;
        default:
            break;
    }
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

#pragma mark - 实现跳转动画
- (void)presentAnimation:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    //通过viewControllerForKey取出转场前后的两个控制器，这里toVC就是vc1、fromVC就是vc2
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //snapshotViewAfterScreenUpdates可以对某个视图截图，我们采用对这个截图做动画代替直接对vc1做动画，因为在手势过渡中直接使用vc1动画会和手势有冲突， 如果不需要实现手势的话，就可以不是用截图视图了，大家可以自行尝试一下
    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    //因为对截图做动画，vc1就可以隐藏了
    fromVC.view.hidden = YES;
    // 这里有个重要的概念containerView，如果要对视图做转场动画，视图就必须要加入containerView中才能进行，可以理解containerView管理着所有做转场动画的视图
    UIView *containerView = [transitionContext containerView];
    //将截图视图和vc2的view都加入ContainerView中
    [containerView addSubview:tempView];
    [containerView addSubview:toVC.view];
    //设置vc2的frame，因为这里vc2present出来不是全屏，且初始的时候在底部，如果不设置frame的话默认就是整个屏幕咯，这里containerView的frame就是整个屏幕
    toVC.view.frame = CGRectMake(0, containerView.bounds.size.height, containerView.bounds.size.width, 400);
    //开始动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.55 initialSpringVelocity:1.0/0.55 options:0 animations:^{
        toVC.view.transform = CGAffineTransformMakeTranslation(0, -400);
        tempView.transform = CGAffineTransformMakeScale(0.85, 0.85);
    } completion:^(BOOL finished) {
        //使用如下代码标记整个转场过程是否正常完成[transitionContext transitionWasCancelled]代表手势是否取消了，如果取消了就传NO表示转场失败，反之亦然，如果不用手势present的话直接传YES也是可以的，但是无论如何我们都必须标记转场的状态，系统才知道处理转场后的操作，否者认为你一直还在转场中，会出现无法交互的情况，切记！
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        //转场失败后的处理
        if ([transitionContext transitionWasCancelled]) {
            //失败后，我们要把vc1显示出来
            fromVC.view.hidden = NO;
            //然后移除截图视图，因为下次触发present会重新截图
            [tempView removeFromSuperview];
        }
    }];
}

- (void)dismissAnimation:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    //注意在dismiss的时候fromVC就是vc2了，toVC才是VC1了，注意这个关系
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //参照present动画的逻辑，present成功后，containerView的最后一个子视图就是截图视图，我们将其取出准备动画
    UIView *tempView = [transitionContext containerView].subviews[0];
    //动画吧
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        //因为present的时候都是使用的transform，这里的动画只需要将transform恢复就可以了
        fromVC.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            //失败了标记失败
            [transitionContext completeTransition:NO];
        }else{
            //如果成功了，我们需要标记成功，同时让vc1显示出来，然后移除截图视图，
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}



@end
