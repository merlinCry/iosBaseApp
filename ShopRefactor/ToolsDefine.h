//
//  ToolsDefine.h
//  ShopRefactor
//
//  Created by song on 16/2/22.
//  Copyright © 2016年 song. All rights reserved.
//

#ifndef ToolsDefine_h
#define ToolsDefine_h


#pragma mark =================================== toolDefine ========================================


#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define COLOR(R, G, B, A)          [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UIColorFromRGB(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define CLEARCOLOR                  [UIColor clearColor]



#pragma mark =================================== 通知 ========================================

//登录页和主页面切换
#define SHOW_LOGIN                          @"SHOW_LOGIN"
#define SHOW_MAIN                           @"SHOW_MAIN"





#endif /* ToolsDefine_h */
