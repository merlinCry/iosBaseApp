//
//  TestVCViewController.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "TestVCViewController.h"
#import "AFNetWorking.h"
#import "AFURLRequestSerialization.h"
#import <objc/message.h>

@interface TestVCViewController ()

@end

@implementation TestVCViewController
@dynamic hello;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
//    NSString *ipAddress = @"http://m.8dol.com/api/store/list";
//    [ZTNetCenter GETJSON:ipAddress parameters:nil responseHandler:^(id  _Nullable responseObject, NSError * _Nullable error) {
//        if (responseObject) {
//            
//        }else{
//        
//        
//        }
//    }];
    
//    NSString *className = [NSString stringWithUTF8String:class_getName([self class])];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)fly
{
    NSLog(@"old------fly");
}

void newFly()
{
    NSLog(@"new------fly");
}


-(void)testSel:(NSString *)str
{
    
}

@end
