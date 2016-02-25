//
//  ZTTabBar.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "ZTTabBar.h"

@implementation ZTTabBar

-(void)setBage:(NSString *)bageString atIndex:(NSInteger)index;
{
    if ( index >= self.items.count)return;
    
    UITabBarItem *item = [self.items objectAtIndex:index];
    item.badgeValue = bageString;
    
}

@end
