//
//  WWBaseModel.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWBaseModel : NSObject

/**
 映射关系表
 key为属性名，value为服务器字段
 */
- (NSDictionary *)mappingTable;

@end
