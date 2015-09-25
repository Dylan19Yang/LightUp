//
//  API.m
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import "API.h"
#import "HttpClient.h"

@implementation API
#pragma mark - Singleton
+ (instancetype)sharedAPI{
    static API *_sharedAPI = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        _sharedAPI = [[API alloc]init];
    });
    return _sharedAPI;
}

#pragma mark - Get methods
-(void)loginWithAccount:(NSString*) account
               password:(NSString*)pwd
               andBLock:(ResponseBlock)block{
    
//    [[HttpClient sharedClient] getAPI:API_Login
//                               params:@{@"RequestType":@"Login",
//                                        @"UserCode":account,
//                                        @"UserPassword":pwd}
//                                block:block];
    
}

#pragma mark - Post Methods
@end
