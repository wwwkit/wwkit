//
//  UIWindow+Ext.m
//  WWKit
//
//  Created by awen on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "UIWindow+Ext.h"

@implementation UIWindow (Ext)

- (UIViewController*)topMostVC
{
    UIViewController *topController = [self rootViewController];
    
    //  Getting topMost ViewController
    while ([topController presentedViewController])    topController = [topController presentedViewController];
    
    //  Returning topMost ViewController
    return topController;
}

- (UIViewController*)currentVC;
{
    UIViewController *currentViewController = [self topMostVC];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}
@end
