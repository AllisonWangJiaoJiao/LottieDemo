//
//  AnimationHelper.h
//  LottieDemo
//
//  Created by Allison on 2022/2/23.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
//需要Lottie动画再引入该库,不需要可不引入
#import <Lottie/Lottie.h>

NS_ASSUME_NONNULL_BEGIN

@interface AnimationHelper : CAAnimation
/// 带重力效果的弹跳
/// @param animationView 动画视图
+ (void)gravityAnimation:(UIView *)animationView;


/// 先放大，再缩小动画
/// @param animationView 动画视图
+ (void)zoominTozoomoutAnimation:(UIView *)animationView;

/// z轴旋转动画
/// @param animationView 动画视图
+ (void)zaxleRotationAnimation:(UIView *)animationView;

/// y轴位移动画
/// @param animationView 动画视图
+ (void)yaxleMovementAnimation:(UIView *)animationView;

/// 放大并保持
/// @param viewArray 视图数组
/// @param index 当前视图索引
+ (void)zoominKeepEffectAnimation:(NSArray *)viewArray index:(NSInteger)index;

/// lottie动画
/// @param currentAnimationView 当前动画视图
/// @param index 当前动画视图索引
+ (void)lottieAnimation:(UIView *)currentAnimationView index:(NSInteger)index;


@end

NS_ASSUME_NONNULL_END
