//
//  NSObject+Associate.h
//  ShopRefactor
//
//  Created by song on 16/3/1.
//  Copyright © 2016年 song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Associate)
/**
 * 关联一个对象(动态为实例添加一个属性)
 */
- (void)associateValue:(id)value withKey:(void *)key;

/**
 * 获取一个关联值
 */
- (id)associatedValueForKey:(void *)key;

@end
