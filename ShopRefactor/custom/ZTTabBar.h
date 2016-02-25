//
//  ZTTabBar.h
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZTTabBar;

@protocol ZTTabBarDelegate <UITabBarDelegate>

//待添加

@end

@interface ZTTabBar : UITabBar

@property(nonatomic,weak)id<ZTTabBarDelegate> ztDelegate;

/**
 *提示数字
 */
-(void)setBage:(NSString *)bageString atIndex:(NSInteger)index;

@end
