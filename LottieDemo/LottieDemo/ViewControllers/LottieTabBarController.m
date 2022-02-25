//
//  LottieTabBarController.m
//  LottieDemo
//
//  Created by Allison on 2022/2/23.
//

#import "LottieTabBarController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

#import "AnimationHelper.h"

@interface LottieTabBarController ()<UITabBarControllerDelegate>
@property(nonatomic, strong) LOTAnimationView *animationView;
@end

@implementation LottieTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    [self.tabBar setBackgroundColor:[UIColor whiteColor]];

    // 添加子控制器
    [self setupChildVC:[FirstViewController class]
                 title:@"First"
              andImage:@"icon_home_home"
        andSelectImage:@"icon_home_home_select"];
    [self setupChildVC:[SecondViewController class]
                 title:@"Second"
              andImage:@"icon_home_up"
        andSelectImage:@"icon_home_up_select"];
    [self setupChildVC:[ThirdViewController class]
                 title:@"Third"
              andImage:@"icon_home_card"
        andSelectImage:@"icon_home_card_select"];
    [self setupChildVC:[FourthViewController class]
                 title:@"Fourth"
              andImage:@"icon_home_me"
        andSelectImage:@"icon_home_me_select"];
}

#pragma mark - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    [self setAnaimationWithTabBarController:tabBarController selectViewController:viewController];
}

- (void)setAnaimationWithTabBarController:(UITabBarController *)tabBarController selectViewController:(UIViewController *)viewController {
    //1.
    NSInteger index = [tabBarController.viewControllers indexOfObject:viewController];
    __block NSMutableArray <UIView *>*tabBarSwappableImageViews = [NSMutableArray arrayWithCapacity:4];
    //2.
    for (UIView *tempView in tabBarController.tabBar.subviews) {
        if ([tempView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIImageView *tempImageView in tempView.subviews) {
                if ([tempImageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [tabBarSwappableImageViews addObject:tempImageView];
                }
            }
        }
    }
    //3.
    __block UIView *currentTabBarSwappableImageView = tabBarSwappableImageViews[index];
    //动画01-带重力效果的弹跳
//    [AnimationHelper gravityAnimation:currentTabBarSwappableImageView];
    //动画02-先放大，再缩小
//    [AnimationHelper zoominTozoomoutAnimation:currentTabBarSwappableImageView];
    //动画03-Z轴旋转
//    [AnimationHelper zaxleRotationAnimation:currentTabBarSwappableImageView];
    //动画04-Y轴位移
//    [AnimationHelper yaxleMovementAnimation:currentTabBarSwappableImageView];
    //动画05-放大并保持
//    [AnimationHelper zoominKeepEffectAnimation:tabBarSwappableImageViews index:index];
    //动画06-Lottie动画
    [AnimationHelper lottieAnimation:currentTabBarSwappableImageView index:index];

}


#pragma mark - Custom
/**
 * 初始化子控制器
 */
- (void)setupChildVC:(Class)vc title:(NSString *)title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
    
    UIViewController * VC = [[vc alloc] init];
    //VC.view.backgroundColor = UIColor.whiteColor;
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:VC];
    nvc.tabBarItem.title = title;
    nvc.tabBarItem.image = [[UIImage imageNamed:image]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvc.tabBarItem.imageInsets = UIEdgeInsetsMake(-1.5, 0, 1.5, 0);
    [self addChildViewController:nvc];
}


@end
