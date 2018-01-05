//
//  UIViewController+TopViewController.m
//  SaveTopViewController
//
//  Created by RaoMeng on 2018/1/5.
//  Copyright © 2018年 TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "UIViewController+TopViewController.h"
#import <objc/runtime.h>

@implementation UIViewController (TopViewController)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oldMethod = class_getInstanceMethod([self class], @selector(viewDidAppear:));
        Method newMethod = class_getInstanceMethod([self class], @selector(topView_ViewDidAppear:));
        // 判断如果这个类没有实现，父类实现了，直接替换父类的方法不是想要的结果
        BOOL didChangeMethod = class_addMethod([self class], @selector(viewDidAppear:), method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (didChangeMethod) {
            class_replaceMethod([self class], @selector(topView_ViewDidAppear:), method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        } else {
            method_exchangeImplementations(oldMethod, newMethod);
        }
    });
}

- (void)topView_ViewDidAppear:(BOOL)animated {
    
    [self topView_ViewDidAppear:animated];
    if (self.isIgnore == NO) {
        [Tool shareCenter].topViewController = self;
        NSLog(@"我走了多少次 ===  %@",[Tool shareCenter].topViewController);
    }
    
    
}


/**
 给分类的属性实现setter方法

 @param isIgnore <#isIgnore description#>
 */
-(void)setIsIgnore:(BOOL)isIgnore {
    objc_setAssociatedObject(self, &("isIgnore"), @(isIgnore), OBJC_ASSOCIATION_COPY);
}


/**
  给分类实现getter方法

 @return <#return value description#>
 */
- (BOOL)isIgnore {
    
    id value = objc_getAssociatedObject(self, &("isIgnore"));
    return value == nil ? NO : [value boolValue];
}


@end



@implementation Tool

+ (Tool *)shareCenter {
    
    static Tool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[Tool alloc]init];
    });
    return tool;
}


@end
