//
//  TestVCViewController.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "TestVCViewController.h"
#import "AFNetWorking.h"
#import "CTXAlertView.h"
#import <objc/message.h>

@interface TestVCViewController ()

@end

@implementation TestVCViewController
@dynamic hello;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
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
    
//    [CTXTools saveToNSUserDefaults:@"asdf" forKey:@"hehe"];
//    
//    
//    [CTXTools saveToDocment:@"test1.png" content:UIImagePNGRepresentation([UIImage imageNamed:@"newsTipImage"])];
    
    
//    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 20, 20)];
//    [self.view addSubview:img];
//    NSData *data = [CTXTools readFromDocment:@"test1.png"];
//    img.image = [[UIImage alloc]initWithData:data];
    
//    [CTXTools saveToTmp:@"test1.png" content:UIImagePNGRepresentation([UIImage imageNamed:@"newsTipImage"])];
    
    
    
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    
//    [PXAlertView showAlertWithTitle:@"111111111"];
//    
//    [PXAlertView showAlertWithTitle:@"222222222"];
//    [PXAlertView showAlertWithTitle:@"3333333333"];

    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
