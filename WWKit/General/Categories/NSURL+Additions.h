//
//  NSURL+Additions.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Additions)
// append query string to url
- (NSURL *)URLByAppendingQueryString:(NSString *)queryString;

@end
