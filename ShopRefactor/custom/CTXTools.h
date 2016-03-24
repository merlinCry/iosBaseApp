//
//  CTXTools.h
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Security/Security.h>

@interface CTXTools : NSObject

//NSUserDefaults存储
+(id)readFromNSUserDefaults:(NSString *)key;

+(void)saveToNSUserDefaults:(id)data  forKey:(NSString *)key;

+(void)deleteFromNSUserDefaults:(NSString *)key;


//keyChain存储
+(id)readFromKeyChain:(NSString *)key;

+(void)saveToKeyChain:(id)data  forKey:(NSString *)key;

+(void)deleteFromKeyChain:(NSString *)key;


//FMDB存储


//本地目录存储
+(NSString *)homeDirectory;
+(NSString *)documentDirectory;
+(NSString *)tmpDirectory;

+(BOOL)createDirectoryAtDocument:(NSString *)dire;


+(BOOL)saveToDocment:(NSString *)fileName content:(NSData *)content;

+(BOOL)saveToTmp:(NSString *)fileName content:(NSData *)content;

+(NSData *)readFromDocment:(NSString *)fileName;

//获取document下的非隐藏文件列表
+(NSArray *)listAllFilesInDocument;

@end
