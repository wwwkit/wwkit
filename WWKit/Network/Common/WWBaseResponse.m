//
//  WWBaseResponse.m
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWBaseResponse.h"

@implementation WWBaseResponse

- (NSDictionary *)mappingTable{
    return @{
             @"code":@"errno"
             ,@"msg":@"errmsg"
             ,@"result":@"rst"
             };
}

@end
