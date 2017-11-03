//
//  WEDodgeKeyboard+AccessObject.h
//  MeiX
//
//  Created by we on 2017/4/14.
//  Copyright © 2017年 ganruihao. All rights reserved.
//

#import "WEDodgeKeyboard.h"
#import <objc/runtime.h>

#import "WEDodgeKeyboardObjects.h"

@interface WEDodgeKeyboard (AccessObject)

+ (WEDodgeKeyboardObjects *)objects;

@end
