//
//  HttpRequest.h
//  NSURLSession
//
//  Created by qianfeng on 16/9/9.
//  Copyright © 2016年 stars. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求成功回调
typedef void(^HttpRequestSuccessCallBack)(id responseObject);

typedef void(^HttpRequestFailureCallBack)(NSError *error);
@interface HttpRequest : NSObject


+(void)GET:(NSString *)urlString paramters:(NSDictionary *)paramters success:(HttpRequestSuccessCallBack)success failure:(HttpRequestFailureCallBack)failure;

@end
