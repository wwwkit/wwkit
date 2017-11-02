//
//  UIWindow+Ext.h
//  WWKit
//
//  Created by awen on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Ext)

/*!
 @method topMostController
 
 @return Returns the current Top Most ViewController in hierarchy.
 */
- (UIViewController*)topMostVC;

/*!
 @method currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)currentVC;

@end
