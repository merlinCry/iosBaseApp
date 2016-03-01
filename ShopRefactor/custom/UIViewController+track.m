//
//  ViewController+track.m
//  ShopRefactor
//
//  Created by song on 16/3/1.
//  Copyright © 2016年 song. All rights reserved.
//

#import "UIViewController+track.h"

@implementation UIViewController(track)


+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIViewController *controller = [UIViewController new];
        Class class = [controller class];
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(new__viewWillAppear:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

//用来替换的方法
-(void)new__viewWillAppear:(BOOL)animated
{
//    [self new__viewWillAppear:animated];
    NSLog(@"注入的代码。。。。。。。。");
    
}

@end
