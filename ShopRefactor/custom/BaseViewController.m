//
//  BaseViewController.m
//  ShopRefactor
//
//  Created by song on 16/2/23.
//  Copyright © 2016年 song. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

-(instancetype)init
{
     self =   [super init];
    if (self) {
        if (IOS_VERSION >= 7.0) {
            self.edgesForExtendedLayout = UIRectEdgeNone;

        }

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
