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
#import <objc/runtime.h>

@interface TestVCViewController ()

@end

@implementation TestVCViewController

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
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
