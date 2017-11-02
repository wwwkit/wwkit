//
//  WWBaseResponse.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WWBaseResponse : NSObject

@property (nonatomic, assign) int code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) id request;

@end
