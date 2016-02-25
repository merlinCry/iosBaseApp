//
//  MainViewController.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "MainViewController.h"
#import "HomePageController.h"
#import "PartTimeController.h"
#import "DiscoveryController.h"
#import "OrderController.h"
#import "SettingController.h"
#import "ZTTabBar.h"
#import "ZTNavigationController.h"

@interface MainViewController ()<ZTTabBarDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVc:[HomePageController  new] title:@"首页" image:nil selectedImage:nil];
    [self addChildVc:[PartTimeController  new] title:@"兼职" image:nil selectedImage:nil];
    [self addChildVc:[DiscoveryController new] title:@"发现" image:nil selectedImage:nil];
    [self addChildVc:[OrderController     new] title:@"订单" image:nil selectedImage:nil];
    [self addChildVc:[SettingController   new] title:@"我的" image:nil selectedImage:nil];

    ZTTabBar *tabbar = [ZTTabBar new];
    tabbar.delegate = self;
    // KVC：如果要修系统的某些属性，但被设为readOnly，就是用KVC，即setValue：forKey：。
    // 修改tabBar为自定义tabBar
    [self setValue:tabbar forKey:@"tabBar"];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    ZTTabBar *tabbar = (ZTTabBar *)self.tabBar;
    [tabbar setBage:@"" atIndex:2];

}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : COLOR(123, 123, 123,1)} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];

    
    // 为子控制器包装导航控制器
    ZTNavigationController *navigationVc = [[ZTNavigationController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
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

#pragma ZTTabBarDelegate

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    //清空item上的标记
    item.badgeValue = nil;
    
}


@end
