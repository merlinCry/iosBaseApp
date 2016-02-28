//
//  ZTNetCenter.h
//  ShopRefactor
//
//  Created by song on 16/2/26.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//结果block
//typedef void (^ResponseHandler)(id _Nullable responseObject,NSError * _Nonnull error);

@interface ZTNetCenter : NSObject

/**
 *网络状态监听
 */
+(void)monitoring;

+(void)stopMonitoring;

/**
 *GET数据请求
 */
+(void)GETJSON:(nullable NSString *)url
    parameters:(nullable id)parameters
   responseHandler:(nullable void (^)(id _Nullable responseObject,NSError * _Nullable error))handler;

/**
 *POST数据请求
 */
+(void)POSTJSON:(nullable NSString *)url
     parameters:(nullable id)parameters
       responseHandler:(nullable void (^)(id _Nullable responseObject,NSError * _Nullable error))handler;



@end
