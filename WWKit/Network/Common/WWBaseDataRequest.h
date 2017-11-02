//
//  WWBaseDataRequest.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WWBaseResponse.h"

typedef enum : NSUInteger{
    WWRequestMethodGet = 0,
    WWRequestMethodPost = 1,           // content type = @"application/x-www-form-urlencoded"
} WWRequestMethod;

@interface WWBaseDataRequest : NSObject

@property (nonatomic, strong, readonly) NSString *requestUrl;
@property(nonatomic,copy)WWBaseResponse *response;

#pragma mark - init methods using blocks

+ (id)requestWithParameters:(NSDictionary*)params
          withIndicatorView:(UIView*)indiView
                  withClass:(Class)objectClass
          onRequestFinished:(void(^)(WWBaseDataRequest *request, WWBaseResponse *result))onFinishedBlock;


- (WWRequestMethod)getRequestMethod;                       //default method is POST
- (NSString *)getRequestUrl;

@end
