//
//  NDAuthManager.h
//  AuthorEx
//
//  Created by song on 16/7/5.
//  Copyright © 2016年 song. All rights reserved.
//  各种权限检查

#import <Foundation/Foundation.h>

typedef void  (^NDAuthBlock)(void);
@interface NDAuthManager : NSObject

//检查相册权限
+(void)checkPhotoAuthor:(NDAuthBlock)success;

//摄像头
+(void)checkVideoAuthor:(NDAuthBlock)success;

//麦克风
+(void)checkAudioAuthor:(NDAuthBlock)success;

//通讯录
+(void)checkAddressBook:(NDAuthBlock)success;

//通讯录old ios9 之前
+(void)checkAddressBookOld:(NDAuthBlock)success;

//备忘录
+(void)checkEK:(NDAuthBlock)success;

//日历
+(void)checkCalender:(NDAuthBlock)success;


+(void)openSetting;
@end
