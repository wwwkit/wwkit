//
//  WWRequest.h
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const BASERequest = @"https://api.meixian360.cn/";

typedef NS_ENUM(NSInteger, WWRequestMode) {
    WWRequestGET = 0,
    WWRequestPOST,
};

@interface WWRequest : NSObject

+ (NSURLSessionDataTask *)GET:(NSString *)url
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure;

+ (NSURLSessionDataTask *)POST:(NSString *)url
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/** 全能请求  isResolve 是否通过json 解析*/
+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url
                              parameters:(id)parameters
                           WERequestMode:(WWRequestMode)requestMode
                               isResolve:(BOOL)isResolve
                                 success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                 failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 上传图片
 */
+ (NSURLSessionDownloadTask *)uploadFileWithMode:(NSString*)mode
                                           image:(UIImage*)image
                                         success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 下载文件
 */
+ (NSURLSessionDownloadTask *)downLoadFromUrl:(NSString*)url
                                     savePath:(NSString*)path
                                     progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                            completionHandler:(void (^)(NSURLResponse *response, NSString *filePath, NSError * error))completionHandler;

@end
