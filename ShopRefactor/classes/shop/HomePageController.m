//
//  HomePageController.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "HomePageController.h"
#import "TestVCViewController.h"
#import "AppDelegate.h"
#import "CTXAlertView.h"

@interface HomePageController ()
@property(nonatomic)UIWindow *alertWindow;

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action:)];
    [self.view addGestureRecognizer:tapges];
    
    
    
    
}


-(void)action:(UITapGestureRecognizer *)ges
{
    TestVCViewController *newVC = [TestVCViewController new];
    newVC.title = @"二级VC";
    [self.navigationController pushViewController:newVC animated:YES];
    

    
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
