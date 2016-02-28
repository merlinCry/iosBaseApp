//
//  ZTNetCenter.m
//  ShopRefactor
//
//  Created by song on 16/2/26.
//  Copyright © 2016年 song. All rights reserved.
//

#import "ZTNetCenter.h"
@implementation ZTNetCenter

+(void)monitoring
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        
        //do sth
    }];
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

+(void)stopMonitoring
{
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];

}


+(AFHTTPSessionManager *)jsonManager
{
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    
    return session;
}

+(void)GETJSON:(NSString *)url parameters:(id)parameters responseHandler:(void (^)(id _Nullable, NSError * _Nullable))handler
{
    if (!parameters || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSDictionary new];
    }
    
    [[ZTNetCenter jsonManager] GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"URL: %@",task.response.URL.absoluteString);
        NSLog(@"JSON: %@", responseObject);
        
        handler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        
        handler(nil,error);
    }];
}


+(void)POSTJSON:(NSString *)url parameters:(id)parameters success:(void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success failure:(void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure
{
    if (!parameters || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSDictionary new];
    }
    
    [[ZTNetCenter jsonManager] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"URL: %@",task.response.URL.absoluteString);
        NSLog(@"JSON: %@", responseObject);
        success(task,responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        failure(task,error);
        
    }];
    
}

+(void)POSTJSON:(NSString *)url parameters:(id)parameters responseHandler:(void (^)(id _Nullable, NSError * _Nullable))handler
{
    if (!parameters || ![parameters isKindOfClass:[NSDictionary class]]) {
        parameters = [NSDictionary new];
    }
    
    [[ZTNetCenter jsonManager] POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"URL: %@",task.response.URL.absoluteString);
        NSLog(@"JSON: %@", responseObject);
        handler(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        handler(nil,error);
    }];
}

@end
