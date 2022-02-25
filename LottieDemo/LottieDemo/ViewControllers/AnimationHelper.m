//
//  AnimationHelper.m
//  LottieDemo
//
//  Created by Allison on 2022/2/23.
//

#import "AnimationHelper.h"

@implementation AnimationHelper

/// 带重力效果的弹跳
/// @param animationView 动画视图
+ (void)gravityAnimation:(UIView *)animationView {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
    //通过初中物理重力公式计算出的位移y值数组
    animation.values = @[@0.0, @-4.15, @-7.26, @-9.34, @-10.37, @-9.34, @-7.26, @-4.15, @0.0, @2.0, @-2.9, @-4.94, @-6.11, @-6.42, @-5.86, @-4.44, @-2.16, @0.0];
    animation.duration = 0.55;
    animation.beginTime = CACurrentMediaTime() + 0.5;
    [animationView.layer addAnimation:animation forKey:nil];
}


/// 先放大，再缩小动画
/// @param animationView 动画视图
+ (void)zoominTozoomoutAnimation:(UIView *)animationView {
    //放大效果，并回到原位
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.autoreverses = YES;    //完成动画后会回到执行动画之前的状态
    animation.fromValue = [NSNumber numberWithFloat:0.7];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.3];     //结束伸缩倍数
    [animationView.layer addAnimation:animation forKey:nil];
}


/// z轴旋转动画
/// @param animationView 动画视图
+ (void)zaxleRotationAnimation:(UIView *)animationView {
    //z轴旋转180度
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:M_PI];     //结束伸缩倍数
    [animationView.layer addAnimation:animation forKey:nil];

}


/// y轴位移动画
/// @param animationView 动画视图
+ (void)yaxleMovementAnimation:(UIView *)animationView {
    //向上移动
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = YES;
    animation.fromValue = [NSNumber numberWithFloat:0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:-10];     //结束伸缩倍数
    [animationView.layer addAnimation:animation forKey:nil];
}

/// 放大并保持
/// @param viewArray 视图数组
/// @param index 当前视图索引
+ (void)zoominKeepEffectAnimation:(NSArray *)viewArray index:(NSInteger)index {
    //放大效果
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;       //执行时间
    animation.repeatCount = 1;      //执行次数
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;           //保证动画效果延续
    animation.fromValue = [NSNumber numberWithFloat:1.0];   //初始伸缩倍数
    animation.toValue = [NSNumber numberWithFloat:1.5];     //结束伸缩倍数
    [[viewArray[index] layer] addAnimation:animation forKey:nil];
    //移除其他tabbar的动画
    for (int i = 0; i<viewArray.count; i++) {
        if (i != index) {
            [[viewArray[i] layer] removeAllAnimations];
        }
    }
}


/// lottie动画
/// @param currentAnimationView 当前动画视图
/// @param index 当前动画视图索引
+ (void)lottieAnimation:(UIView *)currentAnimationView index:(NSInteger)index {
    CGRect frame = currentAnimationView.frame;
    frame.origin.x = 0;
    frame.origin.y = 0;
    //__block LOTAnimationView *lottieAnimationView = [self getAnimationViewAtTabbarIndex:index frame:frame];
    __block LOTAnimationView *lottieAnimationView = [LOTAnimationView animationNamed:[NSString stringWithFormat:@"tabbar%ld",index+1]];
    lottieAnimationView.frame = frame;
    lottieAnimationView.contentMode = UIViewContentModeScaleAspectFill;
    lottieAnimationView.animationSpeed = 1;
    
    //self.animationView = animationView;
    lottieAnimationView.center = currentAnimationView.center;
    [currentAnimationView.superview addSubview:lottieAnimationView];
    currentAnimationView.hidden = YES;
    [lottieAnimationView playFromProgress:0 toProgress:1 withCompletion:^(BOOL animationFinished) {
        currentAnimationView.hidden = NO;
        [lottieAnimationView removeFromSuperview];
        lottieAnimationView = nil;
    }];
    
}

//#pragma mark - Animation
//+ (LOTAnimationView *)getAnimationViewAtTabbarIndex:(NSInteger)index frame:(CGRect)frame {
//
//    // tabbar1 。。。 tabbar4
//    LOTAnimationView *view = [LOTAnimationView animationNamed:[NSString stringWithFormat:@"tabbar%ld",index+1]];
//    view.frame = frame;
//    view.contentMode = UIViewContentModeScaleAspectFill;
//    view.animationSpeed = 1;
//    return view;
//}



@end
