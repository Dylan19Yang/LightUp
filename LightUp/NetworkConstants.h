//
//  NetworkConstants.h
//  LightUp
//
//  Created by YangYuxin on 15/9/24.
//  Copyright © 2015年 Atlas19. All rights reserved.
//
#import <Foundation/Foundation.h>

#ifndef NetworkConstants_h
#define NetworkConstants_h

#define ApiBaseUrl                              @"http://www.saints.com.cn/WechatRepairBusiness/AppService/"

//typedef block
typedef void (^ResponseBlock)(id responseObject, NSError *error);
typedef void (^ResponseError)(NSError *err);
typedef void (^ResponseArray)(NSArray *responseArray, NSError *error);
typedef void (^ResponseString)(NSString *responseString);
#endif /* NetworkConstants_h */
