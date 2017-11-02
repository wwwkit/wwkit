//
//  WWBaseDataRequest.m
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWBaseDataRequest.h"
#import <objc/runtime.h>
#import "WWRequest.h"
#import "WWBaseModel.h"

@implementation WWBaseDataRequest

+ (id)requestWithParameters:(NSDictionary*)params
                withIndicatorView:(UIView*)indiView
                       withClass:(Class)objectClass
            onRequestFinished:(void(^)(WWBaseDataRequest *request, WWBaseResponse *result))onFinishedBlock {
    
    return [[self alloc] initWithParameters:params
                             withRequestUrl:nil
                          withIndicatorView:indiView
                                  withClass:(Class)objectClass
                          onRequestFinished:onFinishedBlock
                            onRequestFailed:nil];
}

- (id)initWithParameters:(NSDictionary*)params
          withRequestUrl:(NSString*)url
       withIndicatorView:(UIView*)indiView
               withClass:(Class)objectClass
       onRequestFinished:(void(^)(WWBaseDataRequest *request, id result))onFinishedBlock
         onRequestFailed:(void(^)(NSError *error))onFailedBlock
{
    _requestUrl = url;
    if (!_requestUrl || ![_requestUrl length]) {
        _requestUrl = [self getRequestUrl];
    }
    NSAssert(_requestUrl != nil || [_requestUrl length] > 0, @"invalid request url");
    if (![_requestUrl hasPrefix:@"http"]) { // 低层网址拼接
        _requestUrl = [BASERequest stringByAppendingString:_requestUrl];
    }
    
    [WWRequest POST:_requestUrl
         parameters:params
            success:^(NSURLSessionDataTask * _Nullable task, id _Nullable responseObject) {
                for (NSString *name in [self getProperties:[_response class]]) {
                    if (responseObject[name]) {
                        
                    }
                }
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
                
            }];
    return nil;
}

- (WWRequestMethod)getRequestMethod{
    return WWRequestMethodPost;
}

- (NSString*)getRequestUrl
{
    NSString *reason = [NSString stringWithFormat:@"This is a abstract method. You should subclass of ITTBaseDataRequest and override it!"];
    @throw [NSException exceptionWithName:@"Logic Error" reason:reason userInfo:nil];
    return @"";
}

//返回当前类的所有属性
- (instancetype)getProperties:(Class)objectClass{
    
    // 获取当前类的所有属性
    unsigned int count;// 记录属性个数
    objc_property_t *properties = class_copyPropertyList(objectClass, &count);
    // 遍历
    NSMutableArray *mArray = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [mArray addObject:name];
    }
    
    return mArray.copy;
}

@end
