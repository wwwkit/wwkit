//
//  WEDodgeKeyboard+AccessObject.m
//  MeiX
//
//  Created by we on 2017/4/14.
//  Copyright © 2017年 ganruihao. All rights reserved.
//

#import "WEDodgeKeyboard+AccessObject.h"

@implementation WEDodgeKeyboard (AccessObject)

+ (WEDodgeKeyboardObjects *)objects
{
    if (!objc_getAssociatedObject(self, _cmd)) {
        objc_setAssociatedObject(self, _cmd, [WEDodgeKeyboardObjects new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, _cmd);
}

@end
