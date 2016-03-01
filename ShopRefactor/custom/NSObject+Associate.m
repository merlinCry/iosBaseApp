//
//  NSObject+Associate.m
//  ShopRefactor
//
//  Created by song on 16/3/1.
//  Copyright © 2016年 song. All rights reserved.
//

#import "NSObject+Associate.h"
@implementation NSObject (Associate)

-(void)associateValue:(id)value withKey:(void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
    
}

-(id)associatedValueForKey:(void *)key
{
    return objc_getAssociatedObject(self, key);
}


@end
