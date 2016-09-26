//
//  HttpRequest.m
//  NSURLSession
//
//  Created by qianfeng on 16/9/9.
//  Copyright © 2016年 stars. All rights reserved.
//

#import "HttpRequest.h"




@implementation HttpRequest


+(NSString *)paramterString:(NSDictionary *)paramters{
    NSArray *allKeys = paramters.allKeys;
    
    NSMutableString *string = [NSMutableString string];
    for (int i = 0 ; i < allKeys.count; i++) {
        NSString *key = allKeys[i];
        
        if (i == allKeys.count - 1) {
            [string appendFormat:@"%@=%@",key,paramters[key]];
            
        }else{
            [string appendFormat:@"%@=%@&",key,paramters[key]];
        }
    }
    return string;
}


+(void)GET:(NSString *)urlString paramters:(NSDictionary *)paramters success:(HttpRequestSuccessCallBack)success failure:(HttpRequestFailureCallBack)failure{
    
    if (paramters) {
        NSString *patamterString = [self paramterString:paramters];
        
        urlString = [NSString stringWithFormat:@"%@?%@",urlString,patamterString];
    }
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    

    
    
  NSURLSessionDataTask *task =  [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

      
      
      if (error && failure) {
          failure(error);
      }
      else{
          if (success) {
              id presonsObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
              success(presonsObject);
          }
      }
      
      
    }];
    [task resume];
}

@end
