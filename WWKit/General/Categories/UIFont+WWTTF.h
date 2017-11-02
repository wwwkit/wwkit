//
//  UIFont+WWTTF.h
//  WWKit
//
//  Created by awen on 2017/11/1.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (WWTTF)


/**
 *  @brief  Obtain a UIFont from a TTF file. If the path to the font is not valid, an exception will be raised,
 *    assuming NS_BLOCK_ASSERTIONS has not been defined. If assertions are disabled, systemFontOfSize is returned.
 *
 *  @param path The path to the TTF file.
 *  @param size The size of the font.
 *
 *  @return A UIFont reference derived from the TrueType Font at the given path with the requested size.
 */

+ (UIFont *)fontWithTTFAtPath:(NSString *)path size:(CGFloat)size;

/**
 *  @brief  便利方法,调用fontWithTTFAtPath:size:从提供的URL中创建一个字体路径
 *
 *  @param URL  字体下载路径.
 *  @param size 字体大小.
 *
 *  @return TrueType字体.
 */

+ (UIFont *)fontWithTTFAtURL:(NSURL *)URL size:(CGFloat)size;

@end
