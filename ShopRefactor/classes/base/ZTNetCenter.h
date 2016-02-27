//
//  ZTNetCenter.h
//  ShopRefactor
//
//  Created by song on 16/2/26.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface ZTNetCenter : NSObject

/**
 *网络状态监听
 */
+(void)monitoring;

+(void)stopMonitoring;

/**
 *GET数据请求
 */
+(void)GETJSON:(nullable NSString *)url parameters:(nullable id)parameters
   success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/**
 *POST数据请求
 */
+(void)POSTJSON:(nullable NSString *)url parameters:(nullable id)parameters
       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;



@end
