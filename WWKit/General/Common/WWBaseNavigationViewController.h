//
//  WWBaseNavigationViewController.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWBaseNavigationViewController : UINavigationController

@property (nonatomic, assign) CGFloat alph;

- (NSUInteger)supportedInterfaceOrientations;
- (BOOL)shouldAutorotate;
@end
