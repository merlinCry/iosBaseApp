//
//  User.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)shareInstance
{
    static dispatch_once_t once;
    static User *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+(void)reloadWithDic:(NSDictionary *)jsondic;
{
    if (![jsondic isKindOfClass:[NSDictionary class]])return;
    User *user = [User shareInstance];
    
    
}

@end
