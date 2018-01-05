//
//  UIViewController+TopViewController.h
//  SaveTopViewController
//
//  Created by RaoMeng on 2018/1/5.
//  Copyright © 2018年 TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (TopViewController)

@property (nonatomic, assign) BOOL isIgnore;

@end


@interface Tool : NSObject

+ (Tool *)shareCenter;

/**
 获取最上层控制器
 */
@property (nonatomic, strong) UIViewController *topViewController;

@end
