//
//  WWRequest.m
//  WWKit
//
//  Created by weigh on 2017/11/2.
//  Copyright © 2017年 wwkit. All rights reserved.
//

#import "WWRequest.h"
#import <AFNetworking/AFNetworking.h>

@implementation WWRequest

/** 全能请求  isResolve 是否通过json 解析*/
+ (NSURLSessionDataTask *)requestWithUrl:(NSString *)url
                              parameters:(id)parameters
                           WERequestMode:(WWRequestMode)requestMode
                               isResolve:(BOOL)isResolve
                                 success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                 failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    NSMutableDictionary* refactoringParameters;//重构参数,为了拼接必传参数
    if (parameters) {
        refactoringParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    }
//    [refactoringParameters setValue:UserDefaultsGet(UserUUID) forKey:@"uuid"];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if (!isResolve) {
        manager.responseSerializer = [AFHTTPResponseSerializer serializer]; // 不进行json解析
    }
    if (requestMode == WWRequestGET) {
        // GET 请求
        return [manager GET:url
                 parameters:refactoringParameters
                   progress:^(NSProgress * _Nonnull downloadProgress) {
                       
                   }
                    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
                        if (success) {
                            if ([responseObject isKindOfClass:[NSData class]]) {
                                responseObject = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                            }
                            success(task,responseObject);
                        }
                    }
                    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
                        if (failure) {
                            failure(task,error);
                        }
                    }];
    }else if (requestMode == WWRequestPOST) {
        // POST 请求
        return [manager POST:url
                  parameters:refactoringParameters
                    progress:^(NSProgress * _Nonnull downloadProgress) {
                        
                    }
                     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                         
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
                        if (success) {
                            if ([responseObject isKindOfClass:[NSData class]]) {
                                responseObject = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                            }
                            success(task,responseObject);
                        }
                     }
                     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                         
                        [UIApplication sharedApplication].networkActivityIndicatorVisible = false;
                        if (failure) {
                            failure(task,error);
                        }
                     }];
    }else{
        NSAssert(false, @"请求参数不能为空！");
        return nil;
    }
}

+ (NSURLSessionDataTask *)GET:(NSString *)url
                   parameters:(id)parameters
                      success:(void (^)(NSURLSessionDataTask * task, id responseObject))success
                      failure:(void (^)(NSURLSessionDataTask * task, NSError * error))failure {
    
    return [self requestWithUrl:url
                     parameters:parameters
                  WERequestMode:WWRequestGET
                      isResolve:YES
                        success:success
                        failure:failure];
}

+ (NSURLSessionDataTask *)POST:(NSString *)url
                    parameters:(id)parameters
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    
    return [self requestWithUrl:url
                     parameters:parameters
                  WERequestMode:WWRequestGET
                      isResolve:YES
                        success:success
                        failure:failure];
}

/**
 上传图片
 */
+ (NSURLSessionDownloadTask *)uploadFileWithMode:(NSString*)mode
                                           image:(UIImage*)image
                                         success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                                         failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    
    return [[AFHTTPSessionManager manager] POST:@"" parameters:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data1 = UIImageJPEGRepresentation(image, 0);
        NSString* type = @"image/*";
        [formData appendPartWithFileData:data1 name:@"imgFile" fileName:@"image.png" mimeType:type];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(task,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(task,error);
    }];
}

/**
 下载文件
 */
+ (NSURLSessionDownloadTask *)downLoadFromUrl:(NSString*)url
                                     savePath:(NSString*)path
                                     progress:(void (^)(NSProgress *downloadProgress)) downloadProgressBlock
                            completionHandler:(void (^)(NSURLResponse *response, NSString *filePath, NSError * error))completionHandler {
    //默认配置
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    //AFN3.0+基于封住URLSession的句柄
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    //请求
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    //下载Task操作
    //_downloadTask =
    return [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        // @property int64_t totalUnitCount;     需要下载文件的总大小
        // @property int64_t completedUnitCount; 当前已经下载的大小
        //NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        // 回到主队列刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            downloadProgressBlock(downloadProgress);
        });
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        //- block的返回值, 要求返回一个URL, 返回的这个URL就是文件的位置的路径
        
        //NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
        //NSString *path = [cachesPath stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //设置下载完成操作
        completionHandler(response,[filePath path],error);
    }];
}

@end
