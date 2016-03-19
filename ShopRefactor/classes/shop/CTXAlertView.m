//
//  CTXAlertView.m
//  ShopRefactor
//
//  Created by song on 16/3/7.
//  Copyright © 2016年 song. All rights reserved.
//

#import "CTXAlertView.h"
#import "AppDelegate.h"

@interface CTXAlertView ()

@property(nonatomic,copy)CTXAlertCompletionBlock  completion;
@property(nonatomic)UITapGestureRecognizer *tap;
@property(nonatomic)UIView   *backView;
@property(nonatomic)UIView   *alertView;
@property(nonatomic)UILabel  *titleLabel;
@property(nonatomic)UIButton *cancelButton;
@property(nonatomic)UIWindow *alertWindow;//提示window
@property(nonatomic)UIWindow *mainWindow; //应用主窗口

@end

static const CGFloat AlertViewWidth                = 270.0;//弹窗宽度
static const CGFloat AlertViewContentMargin        = 10;   //AlertView中元素的内边距
static const CGFloat AlertViewVerticalElementSpace = 10;//元素纵向间距
static const CGFloat AlertViewButtonHeight         = 44;//按钮高度
static const CGFloat AlertViewLineLayerWidth       = 0.5;//分割线宽度

@implementation CTXAlertView

+ (void)showAlertWithTitle:(NSString *)title
{
    CTXAlertView *alertView = [[self alloc] initWithTitle:title];
    
    [alertView show];
    
}

-(instancetype)initWithTitle:(NSString *)title{
    self  = [super init];
    
    if (self) {
        
        _mainWindow = [(AppDelegate *)[UIApplication sharedApplication].delegate  window];
        
        _alertWindow   = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _alertWindow.windowLevel     = UIWindowLevelAlert;
        _alertWindow.backgroundColor = [UIColor clearColor];
        
        
        //背景
        _backView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.25];
        _backView.alpha = 1;
        [self addSubview:_backView];
        
        //手势
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
        [_backView addGestureRecognizer:_tap];
        
        
        //alertView
        _alertView = [[UIView alloc]init];
        _alertView.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1];
        _alertView.layer.cornerRadius = 8.0;
        _alertView.clipsToBounds = YES;
        [self addSubview:_alertView];
        
        //title
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(AlertViewContentMargin,
                                                                    AlertViewVerticalElementSpace,
                                                                    AlertViewWidth - AlertViewContentMargin*2,
                                                                    44)];
        _titleLabel.text = title;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.numberOfLines = 0;
        [_alertView addSubview:_titleLabel];
        
        //分隔线
        CALayer *line = [CALayer layer];
//        line.backgroundColor = [UIColor colorWithWhite:0.9 alpha:0.3].CGColor;
        line.backgroundColor = [UIColor orangeColor].CGColor;

        
        line.frame  = CGRectMake(0, _titleLabel.frame.origin.y + _titleLabel.frame.size.height+ AlertViewVerticalElementSpace, _alertView.frame.size.width, AlertViewLineLayerWidth);
        [_alertView.layer addSublayer:line];
        
        //button
        _cancelButton = [self genericButton];
        [_cancelButton setTitle:@"ok" forState:UIControlStateNormal];
        [_alertView addSubview:_cancelButton];
        _cancelButton.frame = CGRectMake(AlertViewContentMargin,
                                        line.frame.origin.y + AlertViewVerticalElementSpace,
                                         AlertViewWidth - AlertViewContentMargin*2,
                                         44);
        //调整alertView尺寸
        [self resizeContent];
        
    }
    
    
    return self;
}

//+ (instancetype)showAlertWithTitle:(NSString *)title
//                           message:(NSString *)message
//{
//    return [[self class] showAlertWithTitle:title message:message cancelTitle:NSLocalizedString(@"Ok", nil) completion:nil];
//}
//
//+ (instancetype)showAlertWithTitle:(NSString *)title
//                           message:(NSString *)message
//                        completion:(PXAlertViewCompletionBlock)completion
//{
//    return [[self class] showAlertWithTitle:title message:message cancelTitle:NSLocalizedString(@"Ok", nil) completion:completion];
//}
//
//+ (instancetype)showAlertWithTitle:(NSString *)title
//                           message:(NSString *)message
//                       cancelTitle:(NSString *)cancelTitle
//                        completion:(PXAlertViewCompletionBlock)completion
//{
//    PXAlertView *alertView = [[self alloc] initWithTitle:title
//                                                 message:message
//                                             cancelTitle:cancelTitle
//                                              otherTitle:nil
//                                      buttonsShouldStack:NO
//                                             contentView:nil
//                                              completion:completion];
//    [alertView show];
//    return alertView;
//}

#pragma mark-- elementGenerate

- (UIButton *)genericButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    button.titleLabel.adjustsFontSizeToFitWidth = YES;
    button.titleEdgeInsets = UIEdgeInsetsMake(2, 2, 2, 2);
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:0.25 alpha:1] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}


#pragma mark-- customActions

-(void)resizeContent
{
    CGFloat height = AlertViewContentMargin;
    for (UIView *view in _alertView.subviews) {
        height += view.frame.size.height  + AlertViewVerticalElementSpace;
    }
    
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - AlertViewWidth)/2;
    CGFloat y = ([UIScreen mainScreen].bounds.size.height - height)/2;

    
    
    _alertView.frame = CGRectMake(x, y, AlertViewWidth, height);
}



-(void)show
{
    [_alertWindow addSubview:self];
    
    [_alertWindow makeKeyAndVisible];
    [UIView animateWithDuration:0.3 animations:^{
        self.backView.alpha = 1;
    }];
}


-(void)dismiss:(id *)sender
{
    [self removeFromSuperview];
    
    [_mainWindow makeKeyAndVisible];
}




@end
