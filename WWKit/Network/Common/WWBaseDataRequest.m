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
            onRequestFinished:(void(^)(WWBaseDataRequest *request, id result))onFinishedBlock {
    
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
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    
                    NSArray *responsePropertiesArray = [self getProperties:[WWBaseResponse class]];
                    _response = [[WWBaseResponse alloc]init];
                    for (NSString *name in responsePropertiesArray) {
                        if ([_response mappingTable][name]) {
                            if (responseObject[[_response mappingTable][name]]) {
                                [_response setValue:responseObject[[_response mappingTable][name]] forKey:name];
                            }
                        }else{
                            if (responseObject[name]) {
                                [_response setValue:responseObject[name] forKey:name];
                            }
                        }
                    }
                    
                    if (_response.result) {
                        
                        NSArray *modelPropertiesArray = [self getProperties:objectClass];
                        
                        if ([_response.result isKindOfClass:[NSArray class]]) { // 数据内是数组情况
                            NSMutableArray *resultArray = [NSMutableArray array];
                            
                            for (id obj in _response.result) {
                                if ([obj isKindOfClass:[NSDictionary class]]) { // 数组内字典
                                    id model = [[objectClass alloc] init];
                                    
                                    for (NSString *name in modelPropertiesArray) {
                                        if ([model isKindOfClass:[WWBaseModel class]]) {
                                            if ([model mappingTable][name]) {
                                                if (obj[[model mappingTable][name]]) {
                                                    [model setValue:obj[[model mappingTable][name]] forKey:name];
                                                }
                                            }else{
                                                if (obj[name]) {
                                                    [model setValue:obj[name] forKey:name];
                                                }
                                            }
                                        }
                                    }
                                    [resultArray addObject:model];
                                }
                            }
                            
                            if (onFinishedBlock) {
                                onFinishedBlock(self,resultArray);
                            }
                        }else if ([_response.result isKindOfClass:[NSDictionary class]]) { // 数据是单字典的
                            id model = [[objectClass alloc] init];
                            
                            for (NSString *name in modelPropertiesArray) {
                                if (_response.result[name]) {
                                    [model setValue:_response.result[name] forKey:name];
                                }
                            }
                            if (onFinishedBlock) {
                                onFinishedBlock(self,model);
                            }
                        }
                    }else{
                        DLog(@"无内容数据");
                    }
                }else{
                    NSAssert(false, @"不识别类型");
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nullable error) {
                DLog(@"");
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
- (NSArray *)getProperties:(Class)objectClass{
    
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
    
    return mArray;
}

@end
