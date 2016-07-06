//
//  ViewController.m
//  ShopRefactor
//
//  Created by song on 16/2/22.
//  Copyright © 2016年 song. All rights reserved.
//

#import "ViewController.h"
#import "AFNetWorking.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *imgString = [[NSBundle mainBundle]pathForResource:@"leaves" ofType:@"webp"];
    NSData *imgData     = [NSData dataWithContentsOfFile:imgString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
