//
//  WWHomeModel.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWHomeModel : NSObject

@property (nonatomic, copy)NSString * userName;
@property (nonatomic, copy)NSString * password;

- (NSDictionary *)mappingTable;

@end
