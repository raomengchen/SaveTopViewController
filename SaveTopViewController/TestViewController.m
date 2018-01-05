//
//  TestViewController.m
//  SaveTopViewController
//
//  Created by RaoMeng on 2018/1/5.
//  Copyright © 2018年 TianyingJiuzhou Network Technology Co. Ltd. All rights reserved.
//

#import "TestViewController.h"
#import "UIViewController+TopViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"单例   %@",[[Tool shareCenter].topViewController class]);
    NSLog(@"普通   %@",[self topViewController]);
    
}


- (UIViewController *)topViewController {
    
    UIViewController *topVC;
    topVC = [self getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (topVC.presentedViewController) {
        topVC = [self getTopViewController:topVC.presentedViewController];
    }
    return topVC;
}

- (UIViewController *)getTopViewController:(UIViewController *)vc {
    
    if (![vc isKindOfClass:[UIViewController class]]) {
        return nil;
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getTopViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getTopViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
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
