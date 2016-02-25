//
//  AppDelegate.m
//  ShopRefactor
//
//  Created by song on 16/2/22.
//  Copyright © 2016年 song. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "LoginViewController.h"
#import "GuidePageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark life cycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    //判断显示app介绍页，每次更新新版本的时候才显示
    [self shouldShowAppIntroduce];
    //注册通知
    [self addNotification];
    //从本地加载用户信息
    [self loadUserInfo];
    //友盟
    
    //jpush
    
    //加载主页
//    [self initMain];
    


    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark custom function
//判断是否显示app介绍页
-(void)shouldShowAppIntroduce
{
    //取出本地存储的版本号与当前版本号比较，不同则显示，然后更新本地版本号
    NSString *oldVersion     = [CTXTools readFromNSUserDefaults:@"oldVersion"];
    NSString *currentVersion =[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    
    if (![currentVersion isEqualToString:oldVersion])
    {
        GuidePageController * loadCtrller = [[GuidePageController alloc] init];
        self.window.rootViewController = loadCtrller;
        [CTXTools saveToNSUserDefaults:currentVersion forKey:@"oldVersion"];

    }else{
        [self initMain];
    }

    
}

//加载用户信息
-(void)loadUserInfo
{
    NSDictionary *userDic = [CTXTools readFromNSUserDefaults:@"userInfo"];
    
    if (userDic && [userDic isKindOfClass:[NSDictionary class]]) {
        [User  reloadWithDic:userDic];
    }
    
}

//加载主页
-(void)initMain
{
    MainViewController *vc = [MainViewController new];
    [self switchAnimation];
    self.window.rootViewController = vc;
}

//加载登陆页
-(void)initLogin
{
    LoginViewController *vc = [LoginViewController new];
    [self switchAnimation];
    self.window.rootViewController = vc;
}


#pragma mark
#pragma mark ====== 通知 ======
/**
 *  添加通知
 */
- (void)addNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initLogin) name:SHOW_LOGIN object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(initMain) name:SHOW_MAIN object:nil];
}

/**
 *  移除通知
 */
- (void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SHOW_LOGIN object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:SHOW_MAIN object:nil];
}


#pragma mark
#pragma mark ====== 切换动画 ======
/**
 *  rootviewcontroller 切换动画
 */
- (void)switchAnimation{
    CATransition *tAnimation = [CATransition animation];
    tAnimation.duration = 1.0f;
    tAnimation.timingFunction = UIViewAnimationCurveEaseInOut;
    [self.window.layer addAnimation:tAnimation forKey:@"animation"];
}
@end
