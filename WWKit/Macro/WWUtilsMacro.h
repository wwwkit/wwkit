//
//  WWUtilsMacro.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#ifndef WWUtilsMacro_h
#define WWUtilsMacro_h

#define UIColorFromRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define UIColorFromRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define UIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define UIFontOfSize(s) [UIFont systemFontOfSize:s]
#define NSStringFromInt(intValue) [NSString stringWithFormat:@"%d", intValue]
#define NSStringFromFloat(floatValue) [NSString stringWithFormat:@"%f", floatValue]
#define IsKindOfClass(_x, _class) ([_x isKindOfClass:[_class class]])
#define RespondsToSelector(_c, _m) ([_c respondsToSelector:_m])
#define ISEMPTY(_v) (_v == nil || _v.length == 0)
#define ISNull(_x)   ([_x isKindOfClass:[NSNull class]] || _x == nil)
#define HAVECONTROLLER(value) if(value == nil || value.controller == nil){return;}
#define ARRAY_VALUE(value) (value != nil && [value count] > 0)

#endif /* WWUtilsMacro_h */
