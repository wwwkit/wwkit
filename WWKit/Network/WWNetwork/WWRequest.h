//
//  WWRequest.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, WWRequestMode) {
    WWRequestGET = 0,
    WWRequestPOST,
};

@interface WWRequest : NSObject

+ (nullable NSURLSessionDataTask *)GET:(nullable NSString *)url
                           parameters:(nullable id)parameters
                            isResolve:(BOOL)isResolve
                              success:(nullable void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success
                              failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure;

+ (nullable NSURLSessionDataTask *)POST:(nullable NSString *)url
                    parameters:(nullable id)parameters
                     isResolve:(BOOL)isResolve
                       success:(nullable void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure;

/** 全能请求  isResolve 是否通过json 解析*/
+ (nullable NSURLSessionDataTask *)requestWithUrl:(nullable NSString *)url
                                      parameters:(nullable id)parameters
                                   WERequestMode:(WWRequestMode)requestMode
                                       isResolve:(BOOL)isResolve
                                         success:(nullable void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success
                                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure;

/**
 上传图片
 */
+ (nullable NSURLSessionDownloadTask *)uploadFileWithMode:(nullable NSString*)mode
                                                 image:(nullable UIImage*)image
                                               success:(nullable void (^)(NSURLSessionDataTask * _Nullable, id _Nullable))success
                                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nullable))failure;

/**
 下载文件
 */
+ (nullable NSURLSessionDownloadTask *)downLoadFromUrl:(nullable NSString*)url
                                             savePath:(nullable NSString*)path
                                                      progress:(nullable void (^)(NSProgress * _Nonnull downloadProgress)) downloadProgressBlock
                                             completionHandler:(nullable void (^)(NSURLResponse * _Nonnull response, NSString * _Nonnull filePath, NSError * _Nonnull error))completionHandler;

@end
