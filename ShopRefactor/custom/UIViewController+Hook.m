//
//  ViewController+track.m
//  ShopRefactor
//
//  Created by song on 16/3/1.
//  Copyright © 2016年 song. All rights reserved.
//

#import "UIViewController+Hook.h"

@implementation UIViewController(Hook)


+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIViewController *controller = [UIViewController new];
        Class class = [controller class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(hook__viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);

        
    });
}

//用来替换的方法
-(void)hook__viewWillAppear:(BOOL)animated
{
    //这里其实是调用原来那个viewWillAppear
    [self hook__viewWillAppear:animated];
    NSLog(@"注入的代码。。。。。。。。%s",class_getName([self class]));
    
}

@end
