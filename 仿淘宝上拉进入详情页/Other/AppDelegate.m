//
//  AppDelegate.m
//  仿淘宝上拉进入详情页
//
//  Created by 王奥东 on 16/11/16.
//  Copyright © 2016年 王奥东. All rights reserved.
//

#import "AppDelegate.h"
#import "ADOMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    ADOMainViewController *mainScroller = [[ADOMainViewController alloc] init];
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainScroller];
    
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    window.rootViewController = nav;
    
    self.window = window;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


@end
