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



@end
