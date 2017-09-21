//
//  NSDictionary+UrlEncoding.h
//  WWKit
//
//  Created by awen on 2017/9/21.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (UrlEncoding)

// convert NSDictionary to url string
-(NSString*) urlEncodedString;

@end
