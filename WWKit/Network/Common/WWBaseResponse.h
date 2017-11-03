//
//  WWBaseResponse.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWBaseModel.h"

@interface WWBaseResponse : WWBaseModel

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, copy) id result;

@end
