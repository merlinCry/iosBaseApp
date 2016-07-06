//
//  NDAuthManager.m
//  AuthorEx
//
//  Created by song on 16/7/5.
//  Copyright © 2016年 song. All rights reserved.
//

#import "NDAuthManager.h"
#import <CoreTelephony/CTCellularData.h>
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>
#import <Contacts/Contacts.h>
#import <AddressBook/AddressBook.h>
#import <EventKit/EventKit.h>

@implementation NDAuthManager

//检查相册权限
+(void)checkPhotoAuthor:(NDAuthBlock)success
{
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    
    if (photoAuthorStatus != PHAuthorizationStatusAuthorized) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                NSLog(@"Authorized");
                
            }else{
//                [self openSetting];
                
            }
            
        }];
        
    }else{
        
    }
}

//摄像头
+(void)checkVideoAuthor:(NDAuthBlock)success
{
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//相机权限
    if (AVstatus != AVAuthorizationStatusAuthorized) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {//相机权限
            if (granted) {
                NSLog(@"Authorized");
            }else{
//                [self openSetting];
            }
        }];
        
    }else{
        
    }
}

//麦克风
+(void)checkAudioAuthor:(NDAuthBlock)success
{
    AVAuthorizationStatus AVstatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];//麦克风权限
    
    if (AVstatus != AVAuthorizationStatusAuthorized) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {//麦克风权限
            if (granted) {
                NSLog(@"Authorized");
            }else{
//                [self openSetting];
                
            }
        }];
    }else{
        
    }
}

//通讯录
+(void)checkAddressBook:(NDAuthBlock)success
{
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] != CNAuthorizationStatusAuthorized) {//首次访问通讯录会调用
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (error) return;
            if (granted) {//允许
                
            }else{//拒绝
//                [self openSetting];
                
            }
        }];
    }else{
        //        [self fetchContactWithContactStore:contactStore];//访问通讯录
    }
}
+(void)checkAddressBookOld:(NDAuthBlock)success
{
    ABAuthorizationStatus ABstatus = ABAddressBookGetAuthorizationStatus();
    if (ABstatus != kABAuthorizationStatusAuthorized) {
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, NULL);
        ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
            if (granted) {
                NSLog(@"Authorized");
                CFRelease(addressBook);
                
                
            }else{
//                [self openSetting];
                
            }
        });
        
    }else{
        
        
    }
}
//备忘录
+(void)checkEK:(NDAuthBlock)success
{
    EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeReminder];
    if (EKstatus != EKAuthorizationStatusAuthorized) {
        EKEventStore *store = [[EKEventStore alloc]init];
        [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                NSLog(@"Authorized");
            }else{
//                [self openSetting];
                
            }
        }];
        
    }else{
        
        
    }
}

//日历
+(void)checkCalender:(NDAuthBlock)success
{
    EKAuthorizationStatus EKstatus = [EKEventStore  authorizationStatusForEntityType:EKEntityTypeEvent];
    if (EKstatus != EKAuthorizationStatusAuthorized) {
        EKEventStore *store = [[EKEventStore alloc]init];
        [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                NSLog(@"Authorized");
            }else{
//                [self openSetting];
                
            }
        }];
        
    }else{
        
        
    }
}


+(void)openSetting
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
}


@end
