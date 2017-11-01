//
//  NSString+Additions.m
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "NSString+Additions.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Additions)

+ (NSString *)stringWithUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string;
}

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString {
    if (![queryString length]) {
        return [NSURL URLWithString:self];
    }
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"%@%@%@", self,
                           [self rangeOfString:@"?"].length > 0 ? @"&" : @"?", queryString];
    NSURL *theURL = [NSURL URLWithString:urlString];
    return theURL;
}

- (NSString *)URLStringByAppendingQueryString:(NSString *)queryString {
    if (![queryString length]) {
        return self;
    }
    return [NSString stringWithFormat:@"%@%@%@", self,
            [self rangeOfString:@"?"].length > 0 ? @"&" : @"?", queryString];
}
- (NSString *)URLStringByAppendingQueryStringNoWenHao:(NSString *)queryString {
    if (![queryString length]) {
        return self;
    }
    return [NSString stringWithFormat:@"%@%@", self, queryString];
}

- (CGFloat)widthForFont:(UIFont *)font {
    CGFloat width = [self widthForFont:font width:HUGE lineBreakMode:NSLineBreakByWordWrapping];
    return width;
}

- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width {
    CGFloat height = [self heightForFont:font width:width lineBreakMode:NSLineBreakByWordWrapping];
    return height;
}

- (CGFloat)heightForFont:(UIFont*)font width:(float)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize sizeToFit = [self boundingRectWithSize:CGSizeMake(width, HUGE) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    
    //  CGSize sizeToFit = [self sizeWithFont:font
    //                      constrainedToSize:CGSizeMake(width, CGFLOAT_MAX)
    //                      lineBreakMode:lineBreakMode];
    return sizeToFit.height;
}
- (CGFloat)widthForFont:(UIFont*)font width:(float)width lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize sizeToFit = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return sizeToFit.width;
}

+ (NSString *)filterString:(NSString*)aString filterWith:(NSString*)fStr
{
    aString = [aString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    if ([aString rangeOfString:fStr].location != NSNotFound) {
        aString = [aString stringByReplacingOccurrencesOfString:fStr withString:@""];
        [self filterString:aString filterWith:fStr];
    }
    return aString;
}

- (BOOL)isPureInt
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)isMobile
{
    NSString *mobileRegex = @"^(13[0-9]|15[0-9]|18[0-9]|14[0-9]|17[0-9])[0-9]{8}$";
    NSPredicate *regexTestMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegex];
    return [regexTestMobile evaluateWithObject:self];
}

+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim
{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    }
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}

- (NSString*)MD5
{
    // Create pointer to the string as UTF8
    const char *ptr = [self UTF8String];
    
    // Create byte array of unsigned chars
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    
    // Create 16 byte MD5 hash value, store in buffer
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    // Convert MD5 value in the buffer to NSString of hex values
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x",md5Buffer[i]];
    
    return output;
}

- (NSString *) sha1
{
    //const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

@end
