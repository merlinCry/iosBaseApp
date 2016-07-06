//
//  CTXTools.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "CTXTools.h"

@implementation CTXTools

#pragma mark NSUserDefaults
+(id)readFromNSUserDefaults:(NSString *)key;
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    return  [defaults objectForKey:key];
}

+(void)saveToNSUserDefaults:(id)data  forKey:(NSString *)key;
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:key];
    [defaults synchronize];
}

+(void)deleteFromNSUserDefaults:(NSString *)key;
{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:key];
    [defaults synchronize];
}

#pragma mark keyChain

+(NSMutableDictionary *)getKeychainQuery:(NSString *)service
{
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                (id)kSecClassGenericPassword,(id)kSecClass,
                                service,(id)kSecAttrService,
                                service,(id)kSecAttrAccount,
                                (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
                                nil];
    return dic;
}


+(void)saveToKeyChain:(id)data forKey:(NSString *)key
{
    //获取参数字典，字典里面是一些基本配置信息(不是数据的存储字典，数据不存在这个字典中)
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    
    //删除里面原有的东西
    SecItemDelete((CFDictionaryRef) keychainQuery);
    
    //添加新数据
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}


+(id)readFromKeyChain:(NSString *)key
{
    id ret = nil;
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *exception) {
            NSLog(@"Unarchive of %@ failed: %@", key, exception);
        }
        @finally {
            
        }
    }
    
    if (keyData) CFRelease(keyData);
    
    return ret;
}


+(void)deleteFromKeyChain:(NSString *)key
{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


#pragma mark Document

+(NSString *)homeDirectory
{
    return NSHomeDirectory();
}
+(NSString *)documentDirectory
{
    return [[self homeDirectory] stringByAppendingPathComponent:@"Documents"];
}

+(NSString *)tmpDirectory
{
    return [[self homeDirectory] stringByAppendingPathComponent:@"tmp"];
}

+(BOOL)createDirectoryAtDocument:(NSString *)dire
{
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *path = [[self documentDirectory] stringByAppendingPathComponent:dire];
    
    return  [manager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
}

+(BOOL)saveToDocment:(NSString *)fileName content:(NSData *)content
{
    NSFileManager *manager  = [NSFileManager defaultManager];

    NSString *path = [[self documentDirectory] stringByAppendingPathComponent:fileName];
    return [manager createFileAtPath:path contents:content attributes:nil];
}

+(NSData *)readFromDocment:(NSString *)fileName
{
    NSFileManager *manager  = [NSFileManager defaultManager];
    
    NSString *path = [[self documentDirectory] stringByAppendingPathComponent:fileName];
    if ([manager fileExistsAtPath:path]) {
       return  [manager contentsAtPath:path];
    }
    return nil;
    
}

+(BOOL)saveToTmp:(NSString *)fileName content:(NSData *)content
{
    NSFileManager *manager  = [NSFileManager defaultManager];
    NSString *path = [[self tmpDirectory] stringByAppendingPathComponent:fileName];
    return [manager createFileAtPath:path contents:content attributes:nil];
    
}



+(NSArray *)listAllFilesInDocument
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *bundleURL  = [NSURL URLWithString:[self documentDirectory]];
    NSArray *contents = [fileManager contentsOfDirectoryAtURL:bundleURL
                                   includingPropertiesForKeys:@[]
                                                      options:NSDirectoryEnumerationSkipsHiddenFiles
                                                        error:nil];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension == 'png'"];
//    for (NSURL *fileURL in [contents filteredArrayUsingPredicate:predicate]) {
//        // 在目录中枚举 .png 文件
//        
//        NSLog(@"%@",[fileURL.absoluteString lastPathComponent]);
//    }
    return contents;
}

@end
