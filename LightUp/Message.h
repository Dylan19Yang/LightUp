//
//  Message.h
//  LightUp
//
//  Created by YangYuxin on 15/10/7.
//  Copyright © 2015年 Atlas19. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *headImageUrl;
@property (nonatomic, strong) NSString *percentage;
@property (nonatomic, strong) NSString *messageId;
@property (nonatomic, strong) NSString *messageContent;
@property (nonatomic, strong) NSString *messageImageUrl;
@property (nonatomic, strong) NSString *messageTime;
@property (nonatomic, strong) NSString *messageLike;
@property (nonatomic, strong) NSString *regionId;
@property (nonatomic, strong) NSString *state;
+(Message*)currentMessage;
@end
