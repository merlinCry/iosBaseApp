//
//  CTXAlertView.h
//  ShopRefactor
//
//  Created by song on 16/3/7.
//  Copyright © 2016年 song. All rights reserved.
//

#import <UIKit/UIKit.h>

//通信block
typedef void (^CTXAlertCompletionBlock) (BOOL cancelled,NSInteger buttonIndex);

@interface CTXAlertView : UIView


//只有标题的提示
+(void)showAlertWithTitle:(NSString *)title;

//+ (instancetype)showAlertWithTitle:(NSString *)title
//                           message:(NSString *)message
//                       cancelTitle:(NSString *)cancelTitle
//                        completion:(PXAlertViewCompletionBlock)completion;

@end
