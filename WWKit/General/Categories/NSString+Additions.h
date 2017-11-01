//
//  NSString+Additions.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

/**Returns a new UUID NSString e.g. "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"*/
+ (NSString *)stringWithUUID;

// append query string to url
- (NSURL *)URLByAppendingQueryString:(NSString *)queryString;
// append query string to url
- (NSString *)URLStringByAppendingQueryString:(NSString *)queryString;
- (NSString *)URLStringByAppendingQueryStringNoWenHao:(NSString *)queryString ;

// 计算字符串的高度
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;
- (CGFloat)heightForFont:(UIFont*)font width:(float)width lineBreakMode:(NSLineBreakMode)lineBreakMode;
// 计算字符串的宽度
- (CGFloat)widthForFont:(UIFont *)font;
- (CGFloat)widthForFont:(UIFont*)font width:(float)width lineBreakMode:(NSLineBreakMode)lineBreakMode;
/** 过滤字符 */
+ (NSString *)filterString:(NSString*)aString filterWith:(NSString*)fStr;
/** 判断是否为整形 */
- (BOOL)isPureInt;
/** 判断是否为浮点形 */
- (BOOL)isPureFloat;
/** 判断是否是手机号 */
- (BOOL)isMobile;
/** 却掉html标签*/
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;
/** MD5加密*/
- (NSString*)MD5;
/** sha1*/
- (NSString *) sha1;

@end
