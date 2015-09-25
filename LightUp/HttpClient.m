//
//  HttpClient.m
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "HttpClient.h"
#define TIMEOUTINTERVAL                 20.0
@implementation HttpClient
#pragma mark - Singleton

+ (instancetype)sharedClient{
    
    static HttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[HttpClient alloc]initWithBaseURL:[NSURL URLWithString:ApiBaseUrl]];
    });
    return _sharedClient;
}

#pragma mark - API methods

- (void)getAPI:(NSString *)api params:(NSDictionary *)par block:(ResponseBlock)block{
    NSMutableDictionary *params = [par mutableCopy];
    NSString *uri = [self generateUrlWithPath:api andParams:params];
    
    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    self.requestSerializer.HTTPShouldHandleCookies = NO;
    self.requestSerializer.timeoutInterval = TIMEOUTINTERVAL;
    self.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/plain"];
    NSLog(@"=====================================");
    NSLog(@"%@",uri);
    NSLog(@"=====================================");
    
    [self GET:uri
   parameters:nil
      success:^(NSURLSessionDataTask * __unused task, id json){
          NSLog(@"=====================================");
          NSLog(@"%@",json);
          NSLog(@"=====================================");
          NSDictionary* obj=[json copy];
          //          id obj = [json objectForKey:@"data"];
          if (!obj) {
              NSError *error = [NSError errorWithDomain:@""
                                                   code:0
                                               userInfo:json];
              
              if (block) {
                  block(nil,error);
              }
          }
          else{
              
              if (block) {
                  block(obj,nil);  //崩在这里了貌似-_-#  liu
              }
          }
      }
      failure:^(NSURLSessionDataTask * __unused task, NSError *error){
          NSLog(@"=====================================");
          NSLog(@"%@",error);
          NSLog(@"=====================================");
      }];
    
}

- (void)postAPI:(NSString *)api
         params:(NSDictionary *)par
          block:(ResponseBlock)block
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:par];
    NSString *uri = [self generateUrlWithPath:api andParams:@{}];
    
    [self setResponseSerializer:[AFJSONResponseSerializer serializer]];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    
    //    NSString *jsonString = [self generateJSONStringWithParams:params];
    
    [self.requestSerializer setHTTPShouldHandleCookies:NO];
    [self.requestSerializer setTimeoutInterval:TIMEOUTINTERVAL];
    self.responseSerializer.acceptableContentTypes=[NSSet setWithObject:@"text/plain"];
    
    NSLog(@"http post: %@", uri);
    
    
    [self POST:uri parameters:params success:^(NSURLSessionDataTask *task, id JSON) {
        NSLog(@"post  JSON  %@",JSON);
        if (block) {
            block(JSON, nil);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"json error   %@", error);
    }];
    
}

-(void)uploadPictureAPI:(NSString *)api params:(NSDictionary *)par image:(UIImage *)image imageName:(NSString *)name fileName:(NSString *)fileName andBlock:(ResponseBlock)block {
    
    self.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"text/html",@"text/json"
,nil];
    [self setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self POST:api parameters:par constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:UIImageJPEGRepresentation(image, 1) name:name fileName:fileName mimeType:@"image/jpeg"];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSData* data=responseObject;
        NSString *str=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"Success: %@", str);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

#pragma mark - Utils
- (NSString *)generateUrlWithPath:(NSString *)path andParams: (NSDictionary *)params
{
    NSMutableString *url = [[NSMutableString alloc] init];
    [url appendString:path];
    NSArray *allKeys = [params allKeys];
    
    for (int i=0; i< (allKeys ? [allKeys count] : 0); i++) {
        if (i == 0) {
            [url appendString:@"?"];
        }
        NSString *key = [allKeys objectAtIndex:i];
        NSString *v = [params objectForKey:key];
        [url appendFormat:@"%@=%@", key, v.description];
        url=[[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] mutableCopy];
        if (i+1 != [allKeys count]) {
            [url appendString:@"&"];
        }
    }
    return url;
}

- (NSString *)generateJSONStringWithParams:(NSDictionary *)params
{
    NSLog(@"-------- params %@",params);
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"--------------jsonString %@",jsonString);
        return jsonString;
    }
    return nil;
    
}
@end
