//
//  User.h
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

+(instancetype)shareInstance;

+(void)reloadWithDic:(NSDictionary *)jsondic;

@end
